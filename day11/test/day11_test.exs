defmodule Day11Test do
  use ExUnit.Case

  test "increment_energy_level" do
    actual =
      Day11.read_input("sample1")
      |> Day11.increment_energy_level()

    expected = [
      [6, 5, 9, 4, 2, 5, 4, 3, 3, 4],
      [3, 8, 5, 6, 9, 6, 5, 8, 2, 2],
      [6, 3, 7, 5, 6, 6, 7, 2, 8, 4],
      [7, 2, 5, 2, 4, 4, 7, 2, 5, 7],
      [7, 4, 6, 8, 4, 9, 6, 5, 8, 9],
      [5, 2, 7, 8, 6, 3, 5, 7, 5, 6],
      [3, 2, 8, 7, 9, 5, 2, 8, 3, 2],
      [7, 9, 9, 3, 9, 9, 2, 2, 4, 5],
      [5, 9, 5, 7, 9, 5, 9, 6, 6, 5],
      [6, 3, 9, 4, 8, 6, 2, 6, 3, 7]
    ]

    assert actual == expected
  end

  test "sample first star" do
    assert Day11.solve1("sample1") == 26397
  end

  # test "first star" do
  #   assert Day11.solve1("star1") == 193_275
  # end

  # test "sample second star" do
  #   assert Day11.solve2("sample1") == 288_957
  # end

  # test "second star" do
  #   assert Day11.solve2("star1") == 2_429_644_557
  # end
end
