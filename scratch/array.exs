defmodule Tensor do
  defstruct data: [], shape: []

  def shape(data) do
  end

  def uniform?(data) do
  end

  def new(), do: %Tensor{}
  def new(data), do: %Tensor{data: data, shape: shape(data)}

  defimpl Enumerable, for: Tensor do
    def count(tensor), do: tensor.shape |> Enum.reduce(1, &*/2)

    def reduce(tensor, acc, fun) do
      Enum.reduce(tensor.data, acc, fun)
    end

    def member?(tensor, value) do
      Enum.member?(tensor.data, value)
    end

    def nth(tensor, n) do
      Enum.reduce(1..n, tensor.data, fn x, acc -> Enum.at(acc, x) end)
    end
  end
end

x = [[1, 2], 2, 3]
IO.inspect(Tensor.new([1, 2, 3]))
IO.inspect(Tensor.depth(x))
