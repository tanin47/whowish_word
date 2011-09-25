# encoding: utf-8
module JsonRspecHelper
  
  def expect_json_response
    response.should be_success
    return ActiveSupport::JSON.decode(response.body)
  end
  
end