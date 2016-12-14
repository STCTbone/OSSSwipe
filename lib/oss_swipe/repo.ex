defmodule OssSwipe.Repo do
  use Ecto.Repo, otp_app: :oss_swipe
  use Scrivener, page_size: 20
end
