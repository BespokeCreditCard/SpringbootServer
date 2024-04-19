from sqlalchemy import create_engine
import pymysql
import pandas as pd
from db_info import sql_info
import time

start_time = time.time()
print("start :", start_time)
db_url, csv_path = sql_info()

db_connection = create_engine(db_url)
conn = db_connection.connect()
print("DB 연결 완료")

df = pd.read_csv(csv_path, index_col=False, encoding="utf-8-sig")
# df.to_sql(name='financial_data', con=db_connection, if_exists='replace',index=False)

from tqdm import tqdm

# 작은 배치 크기 설정
batch_size = 1000

with tqdm(total=len(df)) as pbar:
    # 작은 배치 데이터프레임 생성
    for i in range(0, len(df), batch_size):
        batch_df = df[i:i+batch_size]
        try:
            batch_df.to_sql(name='financial_data', con=db_connection, if_exists='append', index=False)
            # tqdm 업데이트
            pbar.update(len(batch_df))
        except Exception as e:
            print(f"배치 데이터 삽입 중 오류가 발생하였습니다: {e}")

print("CSV 업로드 완료")

end_time = time.time()
print("end :", end_time)
print("time :", end_time - start_time)