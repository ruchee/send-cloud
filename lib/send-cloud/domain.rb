module SendCloud

  module Domain

    extend self

    # 查询（批量查询）
    def list (params = {})
      SendCloud.post('domain/list', params, [])
    end

    # 添加
    def add (params = {})
      SendCloud.post('domain/add', params, [:name])
    end

    # 修改
    def update (params = {})
      SendCloud.post('domain/update', params, [:name, :newName])
    end

  end

end
