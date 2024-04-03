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

df = pd.read_csv(csv_path, index_col=False)
# df.to_sql(name='similarity', con=db_connection, if_exists='replace',index=False)
df.to_sql(name='Recommendation', con=db_connection, if_exists='replace',index=False)
print("CSV 업로드 완료")

end_time = time.time()
print("end :", end_time)
print("time :", end_time - start_time)