module SendCloud

  module Label

    extend self

    # 查询（批量查询）
    def list (params = {})
      SendCloud.post('label/list', params, [])
    end

    # 查询
    def get (params = {})
      SendCloud.post('label/get', params, [:labelId])
    end

    # 添加
    def add (params = {})
      SendCloud.post('label/add', params, [:labelName])
    end

    # 修改
    def update (params = {})
      SendCloud.post('label/update', params, [:labelId, :labelName])
    end

    # 删除
    def delete (params = {})
      SendCloud.post('label/delete', params, [:labelId])
    end

  end

end
