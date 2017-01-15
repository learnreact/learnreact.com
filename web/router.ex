defmodule LearnReact.Router do
  use LearnReact.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :assign_current_user
  end

  pipeline :admin do
    plug :require_ownership
  end

  scope "/", LearnReact do
    pipe_through :browser

    resources "/lessons", LessonController, only: [:show]
    resources "/courses", CourseController, only: [:index, :show]

    get "/", CourseController, :index
  end

  scope "/admin", LearnReact do
    pipe_through :browser
    pipe_through :admin

    resources "/lessons", LessonController, only: [:new, :create, :edit, :update, :delete]
    resources "/courses", CourseController, only: [:new, :create, :edit, :update, :delete]
    resources "/users", UserController
    resources "/charges", ChargeController
    resources "/purchases", PurchaseController
  end

  scope "/auth", LearnReact do
    pipe_through :browser

    get "/:provider", AuthController, :index
    get "/:provider/callback", AuthController, :callback

    delete "/logout", AuthController, :delete
  end

  defp assign_current_user(conn, _) do
    assign(conn, :current_user, get_session(conn, :current_user))
  end

  defp require_ownership(conn, _params) do
    user = get_session(conn, :current_user)

    if user && user.github_id == 658360 do
      conn
    else
      conn
      |> redirect(to: "/")
    end
  end
end
