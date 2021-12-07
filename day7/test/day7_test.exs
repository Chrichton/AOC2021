defmodule Day7Test do
  use ExUnit.Case
  doctest Day7

  test "sample first star" do
    assert Day7.solve1("sample1") == 37
  end

  test "first star" do
    assert Day7.solve1("star1") == 352_997
  end

  test "move_crab_from_to" do
    assert Day7.move_crab_from_to(16, 5) == 66
  end

  test "move_all_crabs_to_position2" do
    actual =
      [16, 1, 2, 0, 4, 2, 7, 1, 2, 14]
      |> Day7.move_all_crabs_to_position2(5)

    assert actual == 168
  end

  test "sample second star" do
    assert Day7.solve2("sample1") == 168
  end

  test "second star" do
    assert Day7.solve2("star1") == nil
  end
end
