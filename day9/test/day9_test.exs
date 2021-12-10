defmodule Day9Test do
  use ExUnit.Case

  test "get_neighbors" do
    map = [
      [1, 2],
      [3, 4]
    ]

    expected = [
      [{{0, 0}, [{1, 0}, {0, 1}]}, {{0, 1}, [{1, 1}, {0, 0}]}],
      [{{1, 0}, [{0, 0}, {1, 1}]}, {{1, 1}, [{0, 1}, {1, 0}]}]
    ]

    assert Day9.get_neighbors(map) == expected
  end

  test "sample first star" do
    assert Day9.solve1("sample1") == nil
  end

  # test "first star" do
  #   assert Day9.solve1("star1") == nil
  # end

  # test "sample second star" do
  #   assert Day9.solve2("sample1") == nil
  # end

  # test "second star" do
  #   assert Day9.solve2("star1") == nil
  # end
end
