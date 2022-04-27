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
