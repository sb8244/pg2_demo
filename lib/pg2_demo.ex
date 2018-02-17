defmodule Pg2Demo do
  @doc """
  Connect up to 5 local nodes
  """
  def connect() do
    (1..5)
    |> Enum.map(fn i ->
      node = :"#{i}@127.0.0.1"
      {node, Node.connect(node)}
    end)
  end

  @doc """
  Demonstrate an update via synchronization
  """
  def update do
    Pg2Demo.Synchronization.update(:test)
  end
end
