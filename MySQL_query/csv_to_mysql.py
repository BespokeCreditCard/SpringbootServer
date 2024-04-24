from sqlalchemy import create_engine
import pymysql
import pandas as pd
from db_info import sql_info
import time
from tqdm import tqdm
import re

def to_mysql(batch, table_name, dataframe, db_connection):
    # 작은 배치 크기 설정
    batch_size = batch

    with tqdm(total=len(dataframe)) as pbar:
        # 작은 배치 데이터프레임 생성
        for i in range(0, len(dataframe), batch_size):
            batch_df = dataframe[i:i+batch_size]
            try:
                batch_df.to_sql(name=table_name, con=db_connection, if_exists='append', index=False)
                # tqdm 업데이트
                pbar.update(len(batch_df))
            except Exception as e:
                print(f"배치 데이터 삽입 중 오류가 발생하였습니다: {e}")

start_time = time.time()
print("start :", start_time)
db_url, csv_path1 = sql_info()

# 여러개 한번에 넣기
csv_path_list = [csv_path1]
# csv_path_list.append("C:/Users/JunGyuRyu/Desktop/FINAL_PROJECT/데이터/사용할 데이터/datas/cardImg.csv")
# csv_path_list.append("C:/Users/JunGyuRyu/Desktop/FINAL_PROJECT/데이터/사용할 데이터/datas/test.csv")
# csv_path_list.append("C:/Users/JunGyuRyu/Desktop/FINAL_PROJECT/데이터/사용할 데이터/datas/train_dev.csv")
# csv_path_list.append("C:/Users/JunGyuRyu/Desktop/FINAL_PROJECT/데이터/사용할 데이터/datas/users_dev.csv")
# csv_path_list.append("C:/Users/JunGyuRyu/Desktop/FINAL_PROJECT/데이터/사용할 데이터/datas/visualization_dev.csv")

db_connection = create_engine(db_url)
conn = db_connection.connect()
print("DB 연결 완료")
batch_size = 1000


for csv_path in csv_path_list:
    # 정규표현식 패턴 정의: 'datas/'와 '.csv' 사이의 문자열 매치
    # pattern = r'datas/(.*?)\.csv'
    # match = re.search(pattern, csv_path)
    # table_name = match.group(1)
    table_name = "card74"
    print(csv_path)
    print(table_name)
    encoding = ["cp949", "utf-8-sig"]
    # if table_name == "card74" or table_name == "cardImg":
    #     df = pd.read_csv(csv_path, index_col=False, encoding=encoding[0])
    # else:
    #     df = pd.read_csv(csv_path, index_col=False, encoding=encoding[1])
    # df.to_sql(name='financial_data', con=db_connection, if_exists='replace',index=False)

    df = pd.read_csv(csv_path, index_col=False, encoding=encoding[0])
    
    to_mysql(batch_size, table_name, df, db_connection)

    # 결과 출력
    # if match:
    #     to_mysql(batch_size, table_name, df, db_connection)
    # else:
    #     print("매치되는 문자열이 없습니다.")

print("CSV 업로드 완료")

end_time = time.time()
print("end :", end_time)
print("time :", end_time - start_time)