defmodule LearnReact.Router do
  use LearnReact.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LearnReact do
    pipe_through :browser # Use the default browser stack
    
    resources "/lessons", LessonController
    get "/", LessonController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", LearnReact do
  #   pipe_through :api
  # end
end
