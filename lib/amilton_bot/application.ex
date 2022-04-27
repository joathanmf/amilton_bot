defmodule AmiltonBot.Application do
  use Application

  alias Alchemy.Client
  alias AmiltonBot.Commands

  @impl true
  def start(_type, _args) do
    children = []

    Client.start(Application.get_env(:amilton_bot, :token))
    load_modules()

    opts = [strategy: :one_for_one, name: AmiltonBot.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp load_modules do
    use Commands
  end
end
