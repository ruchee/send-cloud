require File.expand_path('../spec_helper.rb', __FILE__)

describe  SendCloud::Mail do

  describe 'send' do

    it 'should return 200' do
      response = SendCloud::Mail.send({
        from: 'test1@qq.com',
        to: 'test2@qq.com',
        subject: 'test',
        html: 'test'
      })
      expect(response['statusCode']).to eq(200)
    end

  end


  describe 'sendtemplate' do

    it 'should return 200' do
      response = SendCloud::Mail.sendtemplate({
        from: 'test1@qq.com',
        to: 'test2@qq.com',
        subject: 'test',
        xsmtpapi: '{"to": ["test2@qq.com"]}',
        templateInvokeName: 'test'
      })
      expect(response['statusCode']).to eq(200)
    end

  end

end
