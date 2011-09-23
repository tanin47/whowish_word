class ActionMailer::Base
  
  def word_for(id, *p)
    ActionView::Base.whowish_word_for(mailer_name + "/" + @template+".html.erb",id,*p)
  end
  
end