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
            created: container["Created"],
            ports: t_ports(container["Ports"]),
            size_rw: container["SizeRw"],
            size_root_fs: container["SizeRootFs"],
            # TODO: labels
            state: container["State"],
            status: container["Status"]
        }
    end

    defp t_ports(ports) do
        Enum.map(ports, fn port -> t_port(port) end)
    end

    defp t_port(port) do
        %{
            ip: port["IP"],
            private_port: port["PrivatePort"],
            public_port: port["PublicPort"],
            type: port["Type"]
        }
    end
end
