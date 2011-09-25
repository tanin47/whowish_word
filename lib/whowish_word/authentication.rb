module WhowishWord

  module Authentication
   
    attr_accessor :username, :password
    
    def init_username_and_password
      @username ||= "whowishword"
      @password ||= "pass"
    end
    
  end
  
end