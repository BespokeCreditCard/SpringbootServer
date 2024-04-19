
################################################################################
# DALL-E-3 하기
################################################################################
def dall_e(json_data={}):

    with open("flask_server/tmp.json", "r", encoding="utf-8") as f:
        json_data = json.load(f)
    user = json_data[0]["seq"]
    image1 = json_data[0]["image1"]
    image2 = json_data[0]["image2"]
    return user, image1, image2
################################################################################
