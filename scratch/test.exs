defmodule Test do
  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts)
  end

  def add(pid, value) do
    GenServer.call(pid, {:add, value})
  end

  def init(opts) do
    state = opts[:state] || 0
    {:ok, opts}
  end

  def handle_call({:add, value}, _from, state) do
    new_state = state + value
    {:reply, new_state, new_state}
  end
end
