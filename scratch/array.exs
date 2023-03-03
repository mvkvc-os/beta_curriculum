defmodule TwoDArray do
  defstruct data: [], shape: []

  def new(data) do
    shape = [length(data), length(Enum.at(data, 0))]
    %__MODULE__{data: data, shape: shape}
  end
end

defimpl Enumerable, for: TwoDArray do
  def count(enumerable) do
  end

  def member?(enumerable, element) do
  end

  def reduce(enumerable, acc, fun) do
  end

  def slice(enumerable) do
  end
end
