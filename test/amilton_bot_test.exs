defmodule AmiltonBotTest do
  use ExUnit.Case
  doctest AmiltonBot

  test "greets the world" do
    assert AmiltonBot.hello() == :world
  end
end
