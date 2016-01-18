module SendCloud

  module UserInfo

    extend self

    # 查询
    def get (params = {})
      SendCloud.post('userinfo/get', params, [])
    end

  end

end
