module JsonRspecHelper
  def expect_json_response
    response.should be_success
    return ActiveSupport::JSON.decode(response.body)
  end
end