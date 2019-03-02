defmodule HarborWeb.PageController do
  use HarborWeb, :controller

  def index(conn, _params) do
    json(conn, Jason.decode!(HTTPoison.get!("http+unix://%2Fvar%2Frun%2Fdocker.sock/nodes").body))
    #render(conn, "index.html")
  end
end
