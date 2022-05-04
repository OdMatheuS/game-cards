defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 40 cards" do
    deck_lenght = Cards.create_deck() |> length
    assert deck_lenght == 40
  end
end
