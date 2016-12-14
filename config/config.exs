# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :oss_swipe,
  ecto_repos: [OssSwipe.Repo]

# Configures the endpoint
config :oss_swipe, OssSwipe.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "M1HoJcQoDcMKFDtVhvGMxAPCmNJhXDKmSzDJXC0klsISe3SRmCZM5J7WKZhXgpEk",
  render_errors: [view: OssSwipe.ErrorView, accepts: ~w(html json)],
  pubsub: [name: OssSwipe.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine

config :ex_admin,
  repo: OssSwipe.Repo,
  module: OssSwipe,
  modules: [
    OssSwipe.ExAdmin.Dashboard,
    OssSwipe.ExAdmin.Issue,
    OssSwipe.ExAdmin.Project,
    OssSwipe.ExAdmin.EndUser
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :xain, :after_callback, {Phoenix.HTML, :raw}


# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: OssSwipe.User,
  repo: OssSwipe.Repo,
  module: OssSwipe,
  logged_out_url: "/",
  opts: [:rememberable, :authenticatable]
# %% End Coherence Configuration %%
