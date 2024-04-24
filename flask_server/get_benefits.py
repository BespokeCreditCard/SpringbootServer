from db_info import for_mysql
import pymysql
import pandas as pd
import joblib

def cluster_model(seq):
    ################################################################################
    # SEQ 받아서 DB에서 사용자 정보 가져오기
    ################################################################################
    # 데이터베이스 연결 설정
    host, port, user, pw, db = for_mysql()
    conn = pymysql.connect(host=host,
                           port=port,
                            user=user,
                            password=pw,
                            db=db,
                            charset='utf8',
                            cursorclass=pymysql.cursors.DictCursor)
    cursor = conn.cursor()
    print("DB 연결 완료")
    try:
        # 쿼리 작성 필요
        # 데이터 한 행 불러오기 (예제로 id=1을 기준으로 함)
        query = "SELECT * FROM test WHERE SEQ = %s"
        print("=================================================================================")
        print("mysql 연결 시도")
        print(seq)
        print(query)
        print("=================================================================================")
        params = (seq)
        cursor.execute(query, params)
        # 결과를 DataFrame으로 변환
        row = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]
        df = pd.DataFrame(row, columns=column_names)
        df = df.drop(columns=["SEQ"])
        print("================================ 사용자 정보 출력 ================================")
        print(df.shape)
        print(row)
        print("=================================================================================")

        ################################################################################
        # Light_gbm 모델 사용해서 군집 idx 예측
        ################################################################################
        model_path = "flask_server/model/Light_gbm.pkl"
        # with open(model_path, 'rb') as file:
        #     lgbm_model = pickle.load(file)
        lgbm_model = joblib.load(model_path)
        predict_result = lgbm_model.predict(df)
        predicted_cluster_num = int(predict_result[0])
        print("========= 예측한 군집 인덱스 =========")
        print(f"Predicted cluster index: {predicted_cluster_num}")

        # test에서 가져온 행에 target 컬럼 추가, SEQ 다시 추가
        df['SEQ'] = seq
        df['target'] = predicted_cluster_num

        ################################################################################
        # train 테이블에 결과를 삽입
        ################################################################################
        # DataFrame의 각 행을 SQL INSERT 쿼리로 변환하여 삽입
        for _, row in df.iterrows():
            # SEQ가 일치하는 행이 있는지 확인
            cursor.execute("SELECT COUNT(*) FROM train WHERE SEQ = %s", (seq,))
            result = cursor.fetchone()
            print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
            print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
            print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
            print(result)
            print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
            print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
            print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")

            if result['COUNT(*)'] == 0:  # SEQ가 일치하는 행이 없다면 삽입을 진행
                placeholders = ', '.join(['%s'] * len(row))
                columns = ', '.join(row.index)
                sql = f"INSERT INTO train ({columns}) VALUES ({placeholders})"
                cursor.execute(sql, tuple(row))
            else:
                print(f"SEQ {seq}가 이미 존재합니다. 삽입을 건너뜁니다.")
        conn.commit()
        print(df)
        print("=========== train 테이블에 insert 완료 ===========")
    except Exception as e:
        print(f"오류 발생: {e}")
    finally:
        print("=========== 군집 예측 종료 ===========")
        cursor.close()
        conn.close()

    return predicted_cluster_num

def get_benefits(cluster_num=3):
    ################################################################################
    # cluster_num 받아서 DB에서 카드들 idx 가져오기
    ################################################################################
    # 데이터베이스 연결 설정
    host, port, user, pw, db = for_mysql()
    conn = pymysql.connect(host=host,
                           port=port,
                            user=user,
                            password=pw,
                            db=db,
                            charset='utf8',
                            cursorclass=pymysql.cursors.DictCursor)
    print("DB 연결 완료")
    try:
        with conn.cursor() as cursor:
            # `card74` 테이블에서 `군집 인덱스`에 해당하는 행 찾기
            sql = "SELECT * FROM card74 WHERE `군집 인덱스` = %s"
            cursor.execute(sql, (cluster_num,))
            print("군집 index 일치하는 행 추출 완료")
            rows = cursor.fetchall()

            # 모든 컬럼 이름 가져오기
            column_names = [desc[0] for desc in cursor.description]
            
            # 혜택, 카드 인덱스 넣을 리스트
            benefits, card_idxs = [], []
            
            # benefits에 추가할 때 제외할 컬럼들
            exclude_columns  = ["Unnamed: 0", "카드 인덱스", "군집 인덱스", "card"]

            ################################################################################
            # 각 카드에 있는 혜택들만 가져오기
            ################################################################################
            # 군집에 속한 전체 카드의 전체 혜택
            # 각 컬럼별로 0이 아닌 값이 있는지 확인
            for row in rows:
                card_idxs.append(row["카드 인덱스"])  # "카드 인덱스" 값 추가
                for column in column_names:
                    # 카드 이름 컬럼(Unnamed: 0) 제외
                    if row[column] != 0 and column not in benefits and column not in exclude_columns:
                        benefits.append(column)  # 0이 아닌 값을 가진 컬럼 이름 추가
            print("컬럼 이름 추출 완료")
            return card_idxs, benefits  
    except Exception as e:
        print("===================================================")
        print("군집 인덱스로 혜택들을 불러올 때 오류가 발생했습니다.")
        print(e)
        print("===================================================")
    finally:
        conn.close()
        

def model_result(seq):
    ################################################################################
    # 1. SEQ 받아서 군집 분류
    # 2. 군집에 있는 카드들이 가진 혜택 리턴
    # 3. 그 혜택들 중에서 사용자가 5개 골라야 함
    ################################################################################
    print("=====================================")
    print("SEQ로 군집 예측 시작")
    
    # 사용자가 속한 군집
    clusterNum = cluster_model(seq)
    print("군집 인덱스로 카드들, 혜택들 가져오기 시작")

    # 군집에 속한 전체 카드들, 전체 혜택들
    cardIdxs, benefits = get_benefits(clusterNum)
    
    # 결과 반환
    result= {"seq":seq}
    result["clusterNum"] = clusterNum
    result["cardIdxs"] = cardIdxs
    result["benefits"] = benefits
    print("결과:", result)
    print("혜택 길이:", len(result["benefits"]))
    print("=====================================")
    return result