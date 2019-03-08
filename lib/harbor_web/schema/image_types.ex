defmodule HarborWeb.Schema.ImageTypes do
    use Absinthe.Schema.Notation

    object :image do
        field :id, :string
        field :parent_id, :string
        field :repo_tags, list_of(:string)
        field :repo_digests, list_of(:string)
        field :created, :integer
        field :size, :integer
        field :shared_size, :integer
        field :virtual_size, :integer
        # TODO: field :labels, :label
        field :containers, :integer
    end
end