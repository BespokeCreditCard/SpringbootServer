from openai import OpenAI
import db_info
import requests
import json
import base64
from PIL import Image
from io import BytesIO
################################################################################
# DALL-E-3 하기
################################################################################
def generate_img(input_prompt, input_img=None, mask_img=None, mode=0):
    dalle_key = db_info.dall_e_info()
    client = OpenAI(api_key=dalle_key, max_retries=5)

    model = ["dall-e-2", "dall-e-3"]
    quality = ["standard", "hd"]
    style = ["vivid", "natural"]
    img_size = ["1024x1024", "1024x1792", "1792x1024"]
    img_quantity = 2
    format = ["url", "b64_json"]
    
    print(input_prompt)
    print("mode:", mode)
    ################################################################################
    # 프롬프트로 이미지 생성
    ################################################################################
    if mode == 0:
        print("========= mode 0 =========")
        response = client.images.generate(
            model=model[0],
            prompt=input_prompt,
            quality=quality[0],
            style=style[1],
            size=img_size[0],
            n=img_quantity,
            response_format=format[1]
        )
    ################################################################################
    # 이미지 단순 변환 (dall-e-2, 1024x1024까지만 지원)
    ################################################################################
    elif mode == 1:
        print("========= mode 1 =========")
        response = client.images.create_variation(
            model=model[0],
            image=input_img,
            n=img_quantity,
            size=img_size[0],
            response_format=format[1]
        )
    ################################################################################
    # mask 이미지로 부분 변환 (dall-e-2, 1024x1024까지만 지원)
    ################################################################################
    elif mode == 2:
        print("========= mode 2 =========")
        response = client.images.edit(
            model=model[0],
            image=input_img,
            mask=mask_img,
            prompt=input_prompt,
            n=img_quantity,
            size=img_size[0],
            response_format=format[1]
        )
    else:
        response = None
        print("어떤 mode에도 속하지 않음")
    ################################################################################
    # 생성한 이미지 로컬에 저장하고, b64 String return
    ################################################################################
    print("=====================================")
    b64_str1 = response.data[0].b64_json
    b64_str2 = response.data[1].b64_json
    
    img_data1 = base64.b64decode(b64_str1)
    img_data2 = base64.b64decode(b64_str2)

    print("DALL-E 결과1:", b64_str1[:100])
    print("DALL-E 결과2:", b64_str2[:100])
    print("=====================================")
    
    # 이미지 데이터를 로컬 파일로 저장
    with open(r'C:\Users\JunGyuRyu\Desktop\FINAL_PROJECT\imgs\dall-e_test_img\generated_image1.png', 'wb') as handler:
        handler.write(img_data1)
    with open(r'C:\Users\JunGyuRyu\Desktop\FINAL_PROJECT\imgs\dall-e_test_img\generated_image2.png', 'wb') as handler:
        handler.write(img_data2)
    print("로컬에 이미지 저장 완료")
    return b64_str1, b64_str2


################################################################################
# test code
################################################################################
# prompt = "Change the moon into an apple"
# img = open(r'C:\Users\JunGyuRyu\Desktop\FINAL_PROJECT\imgs\dall-e_test_img\22.png', 'rb')
# mask = open(r'C:\Users\JunGyuRyu\Desktop\FINAL_PROJECT\imgs\dall-e_test_img\mask.png', 'rb')

# b64_str1, b64_str2 = generate_img(prompt, img, mask, 2)
# print("======================================================================")
# print("======================================================================")
# print("======================================================================")
# print(b64_str1)
# print("======================================================================")
# print("======================================================================")
# print("======================================================================")
# print(b64_str2)
################################################################################