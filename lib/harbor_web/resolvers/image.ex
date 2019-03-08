defmodule HarborWeb.Resolvers.Image do
    @moduledoc """
    
    """

    def list_images(_parent, _args, _resolution) do
        data = Jason.decode!(HTTPoison.get!("http+unix://%2Fvar%2Frun%2Fdocker.sock/images/json").body)

        {:ok, t_images(data)}
    end

    defp t_images(images), do: Enum.map(images, fn image -> t_image(image) end)

    defp t_image(image) do
        %{
            id: image["Id"],
            parent_id: image["ParentId"],
            repo_tags: image["RepoTags"],
            repo_digests: image["RepoDigests"],
            created: image["Created"],
            size: image["Size"],
            shared_size: image["SharedSize"],
            virtual_size: image["VirtualSize"],
            containers: image["Containers"]
        }
    end

end