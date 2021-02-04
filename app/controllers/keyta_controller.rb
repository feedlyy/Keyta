class KeytaController < ApplicationController
  before_action :getdata

  def numberone
    @data[0]["query"]["courier"].insert(1, "grab_express")
    @data[0]["query"]["courier"].pop

    temp = @data[0]["query"]["courier"][4]
    @data[0]["query"]["courier"][4] = @data[0]["query"]["courier"][5]
    @data[0]["query"]["courier"][5] = temp

    render json: { data: @data[0] }, status: :ok
  end

  def numbertwo
    if @data[0]["results"][0]["services"] != []
      temp = @data[0]["results"][0]["services"][0]["totalPrice"]
      markup = @data[0]["results"][0]["services"][0]["totalPrice"]
      if temp >= 0 && temp <= 17000
        @data[0]["results"][0]["services"][0]["hargaMarkup"] = markup + 1000
      elsif temp >= 17001 && temp <= 30000
        @data[0]["results"][0]["services"][0]["hargaMakrup"] = markup + 2000
      elsif temp >= 30001 && temp <= 40000
        @data[0]["results"][0]["services"][0]["hargaMarkup"] = markup + 3000
      elsif temp >= 40001 && temp <= 129000
        @data[0]["results"][0]["services"][0]["hargaMarkup"] = markup + 5000
      elsif temp >= 129001
        @data[0]["results"][0]["services"][0]["hargaMarkup"] = markup + 7000
      end
    end
    render json: { data: @data[0] }, status: :ok
  end
  
  def getdata
    @helper = Helper.new
    @data = @helper.callApi(request.raw_post, request.authorization)

    if @data[1] == 401
      return render json:{ error: "Unauthorized, please check your token" }, status: :unauthorized
    end

    @data
  end
end
