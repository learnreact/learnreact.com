defmodule LearnReact.PageController do
  use LearnReact.Web, :controller

  def patterns(conn, _params) do
    render conn, "patterns.html", layout: false
  end
end
