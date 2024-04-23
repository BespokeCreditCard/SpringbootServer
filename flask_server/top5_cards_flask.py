from sqlalchemy import create_engine, text
import pymysql
from db_info import for_mysql

################################################################################
# 혜택 5개랑 군집 idx를 받고, DB에서 각 혜택이 가장 큰 카드 return
################################################################################
def top5_cards(benefits, cluster_num, seq):
    try:
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

        card_idxs = []
        
        # 쿼리로 DB에서 혜택 컬럼별로 값이 가장 큰 카드 idx 5개 가져오기
        for benefit in benefits:
            # 만약 card_idxs에 이미 들어있는 idx면 그 다음으로 가장 큰 값을 가져오기
            if card_idxs:
                # card_idxs를 쿼리에 적용 가능한 문자열로 변환
                not_in_sentence = ','.join(map(str, card_idxs))
                query = f"""
                SELECT `카드 인덱스`
                FROM card74
                WHERE `군집 인덱스` = {cluster_num}
                AND `카드 인덱스` NOT IN ({not_in_sentence})
                ORDER BY `{benefit}` DESC
                LIMIT 1;
                """
            else:
                # card_idxs가 비어있는 경우, 기본 쿼리 사용
                query = f"""
                SELECT `카드 인덱스`
                FROM card74
                WHERE `군집 인덱스` = {cluster_num}
                ORDER BY `{benefit}` DESC
                LIMIT 1;
                """

            cursor.execute(query)
            result = cursor.fetchone()
            
            print("=========== result 타입 ===========")
            if result:
                print(type(result), result)
                card_idx = result['카드 인덱스']
                card_idxs.append(card_idx)
            else:
                print("결과 없음")

            # # 결과 출력
            # for i, row in enumerate(result):
            #     print("=========== row ===========")
            #     print(row)
            #     print("카드 인덱스:", row[0], type(row[0]))
            #     card_idxs.append(row[0])
        
        # SEQ, cluster_num, 카드 idx 5개, 혜택 5개를 recommendation 테이블에 삽입
        if len(card_idxs) == 5:
            insert_query = f"""
            INSERT INTO recommendation 
            (SEQ, cluster_num, card_idx1, card_idx2, card_idx3, card_idx4, card_idx5, benefit1, benefit2, benefit3, benefit4, benefit5)
            VALUES 
            ('{seq}', {cluster_num}, {card_idxs[0]}, {card_idxs[1]}, {card_idxs[2]}, {card_idxs[3]}, {card_idxs[4]}, 
            '{benefits[0]}', '{benefits[1]}', '{benefits[2]}', '{benefits[3]}', '{benefits[4]}');
            """
            cursor.execute(insert_query)
            conn.commit()
            if cursor.rowcount == 1:  # 성공적으로 행이 추가되었는지 확인
                print("recommendation에 행이 성공적으로 추가되었습니다.")
                print("넣은 값들:", seq, cluster_num, card_idxs, benefits)
            else:
                print("recommendation 테이블에 행을 추가하지 못했습니다.")
        else:
            print("찾은 카드가 5개가 아닙니다.")
    except Exception as e:
        print(f"오류 발생: {e}")
    finally:
        print("=========== Top5 카드 저장 종료 ===========")
        cursor.close()
        conn.close()
    return card_idxs

def get_top_5(seq, benefits, cluster_num):
    print("============")
    print("고른 혜택으로 카드 5개 뽑기 시작")
    print("============")

    # 혜택 5개로 군집에 있는 카드 중 5개 뽑기
    top5_card_idxs = top5_cards(benefits, cluster_num, seq)
    print("가져온 카드들:", top5_card_idxs)
    print("============")

    # result에 넣을 때는 백틱 제거
    cleaned_benefits = [benefit.replace('`', '') for benefit in benefits]

    result= {}
    result["seq"] = seq
    result["cluster_num"] = cluster_num
    result["top5_card_idxs"] = top5_card_idxs
    result["selected_benefits"] = cleaned_benefits
    
    print("============")
    print("결과:", result)
    print("============")
    return result