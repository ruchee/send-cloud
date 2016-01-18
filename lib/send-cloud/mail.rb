module SendCloud

  module Mail

    extend self

    # 普通发送
    def send (params = {})
      SendCloud.post('mail/send', params, [:from, :to, :subject, :html])
    end

    # 模版发送
    def sendtemplate (params = {})
      SendCloud.post('mail/sendtemplate', params, [:from, :to, :xsmtpapi, :subject, :templateInvokeName])
    end

    # 地址列表发送任务查询
    def taskinfo (params = {})
      SendCloud.post('mail/taskinfo', params, [:maillistTaskId])
    end

  end

end
