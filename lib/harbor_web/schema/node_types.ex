defmodule HarborWeb.Schema.NodeTypes do
    @moduledoc """
    Defines node schema
    """
    use Absinthe.Schema.Notation

    object :node do
        field :id, :string
        field :created_at, :string
        field :updated_at, :string
        field :spec, :node_spec
        field :description, :description

    end

    object :node_spec do
        field :name, :string
        field :labels, :labels
        field :role, :string # TODO: Enforce valid values?
        field :availability, :string # TODO: Enforce valid values?  
    end

    object :description do
        field :hostname, :string
        field :platform, :platform
        field :resources, :resources
        field :engine, :engine
        field :tls_info, :swarm_spec
    end

    object :platform do
        field :architecture, :string
        field :os, :string
    end

    object :resources do
        # TODO: double-check types!
        field :nano_cpus, :integer
        field :memory_bytes, :integer
    end

    object :engine do
        field :engine_version, :string
        # TODO: add labels and plugins
    end

    object :swarm_spec do
        # TODO: add SwarmSpec
    end

    object :labels do
        # TODO: fields for labels
    end
end