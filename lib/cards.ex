defmodule Cards do
  @moduledoc """
  Provides methods for creating and handling a deck of cards
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

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should be in the hand.

## Examples
    iex> deck = Cards.create_deck
    iex> {hand, deck} = Cards.deal(deck,2)
    iex> hand
    ["Ace of Diamonds", "Ace of Hearts"]
"""
  def deal(deck, hand_size) do
    deck
    |> Enum.split(hand_size)
  end

  def save(deck, filename) do
    File.write(filename, deck)
  end

  def read(filename) do
    filename
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, content}), do: content

  defp handle_file({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

end
