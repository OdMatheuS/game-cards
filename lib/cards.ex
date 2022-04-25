defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
    create deck cards, an array of playing cards
  """

  def create_deck do
    ["Ace", "Two", "Three"]
  end

  def shuffle(deck) do
    deck
    |> Enum.shuffle()
  end
end
