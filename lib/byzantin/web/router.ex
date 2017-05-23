defmodule Byzantin.Web.Router do
  use Byzantin.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Byzantin.Web do
    pipe_through :api

    resources "/posts", PostController, except: [:new, :edit]
  end
end
