defmodule Cards do
  @moduledoc """
  Provides methods for creating and handling a deck of cards
  """

  @doc """
    Create a list of strings representing a deck cards.
  """

  def create_deck do
    suits = ["Diamonds", "Hearts", "Clubs", "Spades"]
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Receives a deck of cards and shuffles the cards.
  """
  def shuffle(deck) do
    deck
    |> Enum.shuffle()
  end

  @doc """
  Receives as first parameter a `deck` of cards, and second parameter a `card` to be searched.
  If it finds the `card` it returns `True` if not `False`.

  ## Examples
      iex> my_deck = Cards.create_deck
      iex> Cards.contains?(my_deck, "Ace of Diamonds")
      true
  """
  def contains?(deck, card) do
    deck
    |> Enum.member?(card)
  end

  @doc """
  Divides a deck into a hand and the remainder of the deck.
  The `hand_size` argument indicates how many cards should be in the hand.

  ## Examples
      iex> deck = Cards.create_deck
      iex> {hand, _deck} = Cards.deal(deck,2)
      iex> hand
      ["Ace of Diamonds", "Ace of Hearts"]
  """
  def deal(deck, hand_size) do
    deck
    |> Enum.split(hand_size)
  end

  @doc """
   Save a deck of cards to a local file.
  """
  def save(deck, filename) do
    File.write(filename, deck)
  end

  @doc """
    Read a local file that contains a deck of cards.
  """
  def read(filename) do
    filename
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, content}), do: content

  defp handle_file({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  @doc """
  Creates and returns a deck of cards already shuffled, passing as a parameter the `hand_size`, 
  which informs the number of cards in the deck
  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

end
