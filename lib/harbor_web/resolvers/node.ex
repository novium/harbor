defmodule HarborWeb.Resolvers.Node do
    def list_nodes(_parent, _args, _resolution) do
        {:ok, [%{id: "testnode", description: %{ hostname: "localhost" }}]}
    end
end