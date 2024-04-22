from sqlalchemy import create_engine, text
from db_info import for_sqlalchemy

################################################################################
# 혜택 5개랑 군집 idx를 받고, DB에서 각 혜택이 가장 큰 카드 return
################################################################################
def top5_cards(benefits, cluster_num):
    db_url, csv_path = for_sqlalchemy()
    db_connection = create_engine(db_url)
    conn = db_connection.connect()
    print("DB 연결 완료")

    card_idxs = []
    
    # 만약 card_idxs에 이미 들어있는 idx면 그 다음으로 가장 큰 값을 가져오기
    
    # 쿼리로 DB에서 혜택 컬럼별로 값이 가장 큰 카드 idx 5개 가져오기
    for benefit in benefits:
        query =  text(f"""
        SELECT `카드 인덱스`
        FROM card74
        WHERE `군집 인덱스` = {cluster_num}
        ORDER BY `{benefit}` DESC
        LIMIT 1;
        """)
        result = conn.execute(query)

        # 결과 출력
        for row in result:
            print("카드 인덱스:", row[0], type(row[0]))
            card_idxs.append(row[0])
    
    # 연결 종료
    conn.close()

    return card_idxs

def get_top_5(seq, benefits, cluster_num):
    print("============")
    print("고른 혜택으로 카드 5개 뽑기 시작")
    print("============")

    # 혜택 5개로 군집에 있는 카드 중 5개 뽑기
    top5_card_idxs = top5_cards(benefits, cluster_num)
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
