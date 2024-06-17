defmodule SdxlWeb.Router do
  use SdxlWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", SdxlWeb do
    pipe_through :api

    post "/image", ImageController, :create
  end
end
