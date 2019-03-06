defmodule HarborWeb.Resolvers.Container do
    def list_containers(_parent, _args, _resolution) do
        data = Jason.decode!(HTTPoison.get!("http+unix://%2Fvar%2Frun%2Fdocker.sock/containers/json").body)

        {:ok, t_containers(data)}
    end

    defp t_containers(containers) do
        Enum.map(containers, fn container -> t_container(container) end)
    end

    defp t_container(container) do
        %{
            id: container["Id"],
            names: container["Names"],
            image: container["Image"],
            image_id: container["ImageID"],
            command: container["Command"],
            created: container["Created"]
        }
    end
end
