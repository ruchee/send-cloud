module SendCloud

  module Sms

    extend self

    # 发送一个短信模板给一个或多个用户
    def send (params = {})
      SendCloud.post('smsapi/send', params, [:templateId, :phone], 'sms')
    end

  end

end
