module SendCloud

  module AddressList

    extend self

    # 查询地址列表（批量查询）
    def list (params = {})
      SendCloud.post('addresslist/list', params, [])
    end

    # 添加地址列表
    def add (params = {})
      SendCloud.post('addresslist/add', params, [:address, :name])
    end

    # 修改地址列表
    def update (params = {})
      SendCloud.post('addresslist/update', params, [:address])
    end

    # 删除地址列表
    def delete (params = {})
      SendCloud.post('addresslist/delete', params, [:address])
    end

  end

end
