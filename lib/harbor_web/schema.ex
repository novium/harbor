defmodule HarborWeb.Schema do
    use Absinthe.Schema
    import_types HarborWeb.Schema.NodeTypes
    import_types HarborWeb.Schema.ContainerTypes
    import_types HarborWeb.Schema.ImageTypes
    import_types HarborWeb.Schema.GeneralTypes

    alias HarborWeb.Resolvers

    query do
        @spec "Get all nodes"
        field :nodes, list_of(:node) do
            resolve &Resolvers.Node.list_nodes/3
        end

        @spec "Count nodes"
        field :nodes_count, :count do
            resolve &Resolvers.Node.count_nodes/3
        end

        @spec "Get containers"
        field :containers, list_of(:container) do
            resolve &Resolvers.Container.list_containers/3
        end

        @spec "Get images"
        field :images, list_of(:image) do
            resolve &Resolvers.Image.list_images/3
        end
    end
end