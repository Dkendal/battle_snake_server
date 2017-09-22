use Mix.Config
config :bs, snake_api: Bs.Api

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :bs, BsWeb.Endpoint,
  http: [port: {:system, "PORT"}],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/.bin/webpack",
      "--watch",
      "--stdin",
      "--verbose",
      "--colors",
      cd: Path.expand("../assets", __DIR__)]]


# Watch static and templates for browser reloading.
config :bs, BsWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{lib/bs_web/views/.*(ex)$},
      ~r{lib/bs_web/templates/.*(eex)$}
    ]
  ]

config(:mnesia,
  dir: './databases/dev',
  debug: true)

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20
