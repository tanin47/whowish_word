require 'spec_helper'

describe WhowishWordController do
  it "adds a word correctly" do

    word_id = "test"
    content = "Hello"

    post :change_word, {
                          :word_id => word_id,
                          :content => content
                        }

    body = expect_json_response
    body['ok'].should be_true

    I18n.t(word_id.to_sym).should == content
  end

  it 'calls set on the backend' do
    WhowishWord.backend.any_instance.should_receive(:set)
    post :change_word, { :word_id => 'hi', :content => 'hi' }
  end

  context 'with successful set' do
    before do
      WhowishWord.backend.any_instance.should_receive(:set).and_return(true)
    end

    it 'returns ok: true' do
      post :change_word, { :word_id => 'hi', :content => 'hi' }
      response.body.should == '{"ok":true}'
    end
  end

  context 'with unsuccessful set' do
    before do
      WhowishWord.backend.any_instance.should_receive(:set).and_return(false)
    end

    it 'returns ok: false' do
      post :change_word, { :word_id => 'hi', :content => 'hi' }
      response.body.should == '{"ok":false}'
    end

    it 'returns status :unprocessable_entity' do
      post :change_word, { :word_id => 'hi', :content => 'hi' }
      response.status.should == 422
    end
  end
end
