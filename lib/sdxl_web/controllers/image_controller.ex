defmodule SdxlWeb.ImageController do
  use SdxlWeb, :controller

  def create(conn, %{"text" => image_text}) do
    System.cmd("./sd", ["-m", "./models/SDXL-Flash.safetensors", "-H", "512", "-W", "512", "-p", image_text, "--vae", "./models/sdxl_vae.safetensors", "--steps", "5", "--cfg-scale", "4.0"])
    generated_image = File.read!("output.png")

    conn
    |> put_resp_header("content-type", "image/png")
    |> send_resp(201, generated_image)
  end

  def create(conn, _) do
    send_resp(conn, 422, "text is required parameter")
  end
end
