defmodule OhChat.PageController do
  use OhChat.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
