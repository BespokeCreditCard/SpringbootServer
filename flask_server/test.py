from flask import Flask, request, render_template
import boto3, json
from werkzeug.utils import secure_filename
from socket import *
import get_benefits
import flask_server.top5_cards_flask as top5_cards_flask
import dall_e

def top5_cards_flask():
    # seq, benefits_5, cluster_num 필요
    
   	# Spring에서 받은 데이터를 출력해서 확인
    # print("Type:", type(dto_json), dto_json)

    # # json에서 seq, benefits_5 가져오기
    # seq = dto_json[0]["seq"]
    # benefits_5 = dto_json[0]["benefits_5"]
    # cluster_num = dto_json[0]["cluster_num"]

    ################################################################################
    # sample data
    ################################################################################
    seq_idx = 26
    seq = "K1D7OY9NU64NH9WBSSBD"
    # 쿼리쓸 때 "/" 때문에 str에 `` 씌워서 넣어야 함
    benefits_5 = ["`모든가맹점`", "`교통`", "`쇼핑`", "`카페`", "`병원/약국`"]
    cluster_num = 3
    ################################################################################

    result = top5_cards_flask.get_top_5(seq, benefits_5, cluster_num)
    return result
result = top5_cards_flask()


def receive_string():
	# Spring으로부터 JSON 객체를 전달받음
    # dto_json = request.get_json()
    # seq = dto_json["seq"]

    seq = "qweqwe"
    result = get_benefits.model_result(seq)
    # print("Json result:", result)

   	#Spring에서 받은 데이터를 출력해서 확인
    # print("Type:", type(dto_json), dto_json)

    #dto_json을 dumps 메서드를 사용하여 response에 저장
    # response = json.dumps(dto_json, ensure_ascii=False)
    
    #Spring으로 response 전달
    # return response
    return result

# result = receive_string()