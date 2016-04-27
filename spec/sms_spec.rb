require File.expand_path('../spec_helper.rb', __FILE__)

describe  SendCloud::Sms do

  describe 'send sms' do

    it 'should return 200' do
      response = SendCloud::Sms.send(
        templateId: '11',
        msgType: '0',
        phone: '13800138000',
        vars: '{"%code%":"123456"}'
      )
      expect(response['statusCode']).to eq(200)
    end

  end

end
