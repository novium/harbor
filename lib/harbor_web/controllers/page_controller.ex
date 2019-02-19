defmodule HarborWeb.PageController do
  use HarborWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
