defmodule HarborWeb.Schema.GeneralTypes do
    use Absinthe.Schema.Notation

    object :count do
        field :all, :integer
        field :active, :integer
        field :inactive, :integer
    end
end