module SendCloud

  module AddressMember

    extend self

    # 查询列表成员（批量查询）
    def list (params = {})
      SendCloud.post('addressmember/list', params, [:address])
    end

    # 查询列表成员
    def get (params = {})
      SendCloud.post('addressmember/get', params, [:address, :members])
    end

    # 添加列表成员
    def add (params = {})
      SendCloud.post('addressmember/add', params, [:address, :members])
    end

    # 修改列表成员
    def update (params = {})
      SendCloud.post('addressmember/update', params, [:address, :members])
    end

    # 删除列表成员
    def delete (params = {})
      SendCloud.post('addressmember/delete', params, [:address, :members])
    end

  end

end
