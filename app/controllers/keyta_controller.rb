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
  
  def getdata
    @helper = Helper.new
    @data = @helper.callApi(request.raw_post, request.authorization)

    if @data[1] == 401
      return render json:{ error: "Unauthorized, please check your token" }, status: :unauthorized
    end

    @data
  end
end