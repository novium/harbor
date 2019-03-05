defmodule HarborWeb.Schema do
    use Absinthe.Schema
    import_types HarborWeb.Schema.NodeTypes

    alias HarborWeb.Resolvers

    query do
        @spec "Get all nodes"
        field :nodes, list_of(:node) do
            resolve &Resolvers.Node.list_nodes/3
        end
    end
end