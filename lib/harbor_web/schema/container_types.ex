defmodule HarborWeb.Schema.ContainerTypes do
    @moduledoc """
    Defines types for Containers
    """
    use Absinthe.Schema.Notation

    object :container do
        field :id, :string
        field :names, list_of(:string)
        field :image, :string
        field :image_id, :string
        field :command, :string
        field :created, :integer
        field :ports, list_of(:port)
        field :size_rw, :integer
        field :size_root_fs, :integer
        field :labels, :label
        field :state, :string
        field :status, :string
        field :host_config, :host_config
        field :network_settings, :network_settings
        field :mounts, list_of(:mount)
    end

    object :port do
        field :ip, :string
        field :private_port, :integer # TODO: validation
        field :public_port, :integer
        field :type, :string # TODO: Validation
    end

    object :label do
        # TODO
    end

    object :host_config do
        field :network_mode, :string
    end

    object :network_settings do
        # TODO
    end

    object :mount do
        field :target, :string
        field :source, :string
        field :type, :string # TODO: Validation
        field :read_only, :boolean
        field :consistency, :string # TODO: Validation?
        # TODO: Options
    end
end