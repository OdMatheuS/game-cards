defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
    create deck cards, an array of playing cards
  """

  def create_deck do
    suits = ["Diamonds", "Hearts", "Clubs", "Spades"]
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    deck
    |> Enum.shuffle()
  end

  def contains?(deck, card) do
    deck
    |> Enum.member?(card)
  end
end
