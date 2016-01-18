module SendCloud

  module ApiUser

    extend self

    # 查询（批量查询）
    def list (params = {})
      SendCloud.post('apiuser/list', params, [])
    end

    # 添加
    def add (params = {})
      SendCloud.post('apiuser/add', params, [:name, :emailType, :domainName])
    end

  end

end
