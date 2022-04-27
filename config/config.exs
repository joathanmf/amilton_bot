import Config

config :amilton_bot, token: System.get_env("BOT_TOKEN")

config :porcelain, driver: Porcelain.Driver.Basic

config :alchemy,
  ffmpeg_path: "/usr/bin/ffmpeg",
  youtube_dl_path: "/usr/bin/youtube-dl"
