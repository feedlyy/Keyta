class Helper

  def callApi(body, header)
    url = 'https://sandbox.keyta.id/api/v1/costs'
    @request = HTTParty.post(url,
                             {
                               :body => body.to_json,
                               :headers => { 'Content-Type' => 'application/json',
                                             'Authorization' => header}
                             })
    [JSON.parse(@request.body), @request.code]
  end
end