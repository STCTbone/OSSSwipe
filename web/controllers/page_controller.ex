defmodule OssSwipe.PageController do
  use OssSwipe.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
