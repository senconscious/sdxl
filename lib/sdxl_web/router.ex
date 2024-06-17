defmodule SdxlWeb.Router do
  use SdxlWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SdxlWeb do
    pipe_through :api
  end
end
