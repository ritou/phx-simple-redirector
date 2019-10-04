defmodule SimpleRedirectorWeb.PageController do
  use SimpleRedirectorWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def send(conn, %{"url" => url, "data" => data}) do
    render conn, "send.html", %{url: url, data_list: data |> URI.decode_query() |> Enum.map(fn {k, v} -> {k, v} end) }
  end

  def post(conn, params) do
    render conn, "post.html", %{params: params |> Enum.map(fn {k, v} -> {k, v} end)}
  end
end
