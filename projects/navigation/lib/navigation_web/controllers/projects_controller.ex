defmodule NavigationWeb.ProjectsController do
  use NavigationWeb, :controller

  def index(conn, params_) do
    html(conn, "<h1>Projects</h1>")
  end
end
