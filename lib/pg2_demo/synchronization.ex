defmodule Pg2Demo.Synchronization do
  use GenServer

  @topic {:sync_demo, __MODULE__}

  def start_link([]) do
    GenServer.start_link(__MODULE__, [])
  end

  def topic, do: @topic

  def init([]) do
    :ok = :pg2.create(@topic)
    :ok = :pg2.join(@topic, self())
    {:ok, []}
  end

  def update(some_param) do
    :pg2.get_members(@topic)
    |> Kernel.--(:pg2.get_local_members(@topic))
    |> Enum.each(fn(pid) ->
      IO.puts "Sending update on #{inspect(@topic)} to #{inspect(pid)}"
      send pid, {:broadcast, @topic, {:update, some_param}}
    end)
  end

  def handle_info({:broadcast, @topic, {:update, some_param}}, state) do
    IO.puts "Received update on #{inspect(@topic)} with #{some_param}"
    {:noreply, state}
  end
end
