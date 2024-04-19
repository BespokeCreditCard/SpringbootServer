import os
from flask import Flask, request, render_template, jsonify
import boto3, json
from werkzeug.utils import secure_filename
from socket import *
import get_benefits
import get_top5_cards
import dall_e
import time

app = Flask(__name__)

################################################################################
# !! 주의 route 뒤에 경로는 위에 Spring에서 적은 경로와 같아야함 !!
################################################################################
@app.route('/get_cluster', methods=['POST'])
def cluster_flask():
    # 시작 시간
    start_time = time.time()

	# Spring으로부터 String 전달받음
    seq = request.get_json()

	# # Spring으로부터 JSON 객체를 전달받음
    print("=====================================")

   	# Spring에서 받은 데이터를 출력해서 확인
    print("Type:", type(seq), seq)
    result = get_benefits.model_result(seq)

    # result를 dumps 메서드를 사용하여 문자열로 저장
    response = json.dumps(result, ensure_ascii=False)

    # result를 json으로 저장
    # response = jsonify(result)
    print("군집에 속한 전체 카드, 혜택들")
    print("TYPE:", type(response), response)

    # 종료 시간
    end_time = time.time()
    # print("end :", end_time)
    print(f"실행 시간: {end_time - start_time:.2f}초")
    print("=====================================")
    
    # Spring으로 response 전달
    return response

@app.route('/get_top5_cards', methods=['POST'])
def top5_cards_flask():
    # 시작 시간
    start_time = time.time()
    # print("start :", start_time)
    print("============")

    # seq, selected_benefits, cluster_num 필요
    dto_json = request.get_json()
    
   	# Spring에서 받은 데이터를 출력해서 확인
    print("Type:", type(dto_json), dto_json)

    # # json에서 seq, selected_benefits 가져오기
    seq = dto_json["seq"]
    selected_benefits = dto_json["selected_benefits"]
    cluster_num = dto_json["cluster_num"]

    ################################################################################
    # sample data
    ################################################################################
    # seq_idx = 26
    # seq = "K1D7OY9NU64NH9WBSSBD"
    # selected_benefits = ["모든가맹점", "교통", "쇼핑", "카페", "병원/약국"]
    # cluster_num = 3
    ################################################################################

    result = get_top5_cards.get_top_5(seq, selected_benefits, cluster_num)

    # result를 dumps 메서드를 사용하여 response에 저장
    response = json.dumps(result, ensure_ascii=False)

    # 종료 시간
    end_time = time.time()
    # print("end :", end_time)
    print(f"실행 시간: {end_time - start_time:.2f}초")
    print("============")

    # Spring으로 response 전달
    return response

# 0.0.0.0 으로 모든 IP에 대한 연결을 허용
if __name__ == '__main__':
    app.run('0.0.0.0', port=5000, debug=True)