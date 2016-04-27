require File.expand_path('../spec_helper.rb', __FILE__)

describe  SendCloud::Mail do

  describe 'sendtemplate' do

    it 'should return 200' do
      response = SendCloud::Mail.sendtemplate(
        from: 'xxx@IWZtk4sFyTbLMowA5XE3DQ3oIWAGIjLs.sendcloud.org',
        to: 'my@ruchee.com',
        subject: 'test',
        xsmtpapi: '{"to": ["my@ruchee.com"]}',
        templateInvokeName: 'test_template'
      )
      expect(response['statusCode']).to eq(200)
    end

  end

end
