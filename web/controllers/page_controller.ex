defmodule LearnReact.PageController do
  use LearnReact.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
