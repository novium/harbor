defmodule HarborWeb.Resolvers.Node do
    def list_nodes(_parent, _args, _resolution) do
        data = Jason.decode!(HTTPoison.get!("http+unix://%2Fvar%2Frun%2Fdocker.sock/nodes").body)
        
        {:ok, transform_nodes(data)} 
    end

    def count_nodes(_parent, _args, _resolution) do
        data = Jason.decode!(HTTPoison.get!("http+unix://%2Fvar%2Frun%2Fdocker.sock/nodes").body)
        {:ok, %{ all: length(data) } }
    end


    defp transform_nodes(nodes) do
        Enum.map(nodes, fn node -> transform_node node end)
    end

    defp transform_node(node) do
        %{
            id: node["ID"],
            created_at: node["CreatedAt"],
            updated_at: node["UpdatedAt"],
            spec: t_node_spec(node["Spec"]),
            description: t_description(node["Description"])
        }
    end

    defp t_description(desc) do
        %{
            hostname: desc["Hostname"],
            platform: t_platform(desc["Platform"]),
            resources: t_resources(desc["Resources"]),
            engine: t_engine(desc["Engine"])
        }
    end

    defp t_node_spec(spec) do
        %{
            name: spec["Name"],
            role: spec["Role"],
            availability: spec["Availability"]
            # TODO: labels
        }
    end

    defp t_platform(platform) do
        %{
            architecture: platform["Architecture"],
            os: platform["OS"]
        }
    end

    defp t_resources(resources) do
        %{
            nano_cpus: resources["NanoCPUs"],
            memory_bytes: resources["MemoryBytes"]
        }
    end

    defp t_engine(engine) do
        %{
            engine_version: engine["EngineVersion"]
            # TODO: add labels and plugins
        }
    end
end