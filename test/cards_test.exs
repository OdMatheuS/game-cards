defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 40 cards" do
    deck_lenght = Cards.create_deck() |> length
    assert deck_lenght == 40
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck
    assert deck != Cards.shuffle(deck)
    
  end

end
