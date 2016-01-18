module SendCloud

  module Template

    extend self

    # 查询（批量查询）
    def list (params = {})
      SendCloud.post('template/list', params, [])
    end

    # 查询
    def get (params = {})
      SendCloud.post('template/get', params, [:invokeName])
    end

    # 添加
    def add (params = {})
      SendCloud.post('template/add', params, [:invokeName, :name, :html, :subject, :templateType])
    end

    # 修改
    def update (params = {})
      SendCloud.post('template/update', params, [:invokeName])
    end

    # 提交
    def submit (params = {})
      SendCloud.post('template/submit', params, [:invokeName])
    end

    # 删除
    def delete (params = {})
      SendCloud.post('template/delete', params, [:invokeName])
    end

  end

end
