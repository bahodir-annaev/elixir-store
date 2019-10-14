defmodule Store do

  def receive_action(state) do
    receive do
      {:put, key, value} -> receive_action(Map.put(state,key, value))
      {:get, key, sender_pid} ->
        send(sender_pid, Map.get(state, key, :not_found))
        receive_action(state)
    end
  end

  def run do
    spawn(Store, :receive_action, [%{}])
  end
end
