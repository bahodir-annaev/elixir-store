defmodule StoreAgent do
  def run do
    {:ok, agent} = Agent.start_link(fn -> %{} end)
    agent
  end

  def put(agent, key, value) do
    Agent.update(agent, fn state -> Map.put(state, key, value) end)
  end

  def get(agent, key) do
    Agent.get(agent, fn state -> Map.get(state, key) end)
  end
end
