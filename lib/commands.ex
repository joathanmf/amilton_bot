defmodule AmiltonBot.Commands do
  use Alchemy.Cogs

  alias Alchemy.{Voice, User, VoiceState, Cache}
  alias Alchemy.Guild.GuildMember

  Cogs.def play(url) do
    {:ok, guild_id} = Cogs.guild_id()
    {:ok, %GuildMember{user: %User{id: user_id}}} = Cogs.member()
    {:ok, %VoiceState{channel_id: channel_id}} = Cache.voice_state(guild_id, user_id)

    Voice.join(guild_id, channel_id)
    Voice.play_url(guild_id, url)
    Cogs.say("Tocando agora! #{url}")
  end

  Cogs.def stop do
    {:ok, id} = Cogs.guild_id()
    Voice.stop_audio(id)
    Cogs.say("Stop!")
    Voice.leave(id)
  end
end

# Cogs.def ping do
#   {:ok, g_id} = Cogs.guild_id()
#   {:ok, fuck} = Client.get_channels(g_id)
#   IO.inspect(fuck)
# end

# Cogs.def play(url) do
#   {:ok, id} = Cogs.guild_id()
#   {:ok, %Guild{voice_states: voice_states}} = Cogs.guild()
#   {:ok, %GuildMember{user: %User{id: user_id}}} = Cogs.member()

#   channel_id =
#     Enum.map(voice_states, fn %VoiceState{user_id: u_id, channel_id: c_id} ->
#       cond do
#         u_id == user_id ->
#           c_id

#         true ->
#           nil
#       end
#     end)
#     |> Enum.filter(fn x -> x != nil end)
#     |> List.first()

#   Voice.join(id, channel_id)
#   Voice.play_url(id, url)
#   Cogs.say("Now playing #{url}")
# end
