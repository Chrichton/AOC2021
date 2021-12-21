defmodule Day15Test do
  use ExUnit.Case

  test "sample first star" do
    assert Day15.solve1("sample1") == 40
  end

  test "first star" do
    assert Day15.solve1("star1") == 398
  end

  test "add columns" do
    actual =
      [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
      |> Day15.add_rows()

    expected = [
      [1, 2, 3, 2, 3, 4, 3, 4, 5, 4, 5, 6, 5, 6, 7],
      [4, 5, 6, 5, 6, 7, 6, 7, 8, 7, 8, 9, 8, 9, 1],
      [7, 8, 9, 8, 9, 1, 9, 1, 2, 1, 2, 3, 2, 3, 4],
      [2, 3, 4, 3, 4, 5, 4, 5, 6, 5, 6, 7, 6, 7, 8],
      [5, 6, 7, 6, 7, 8, 7, 8, 9, 8, 9, 1, 9, 1, 2],
      [8, 9, 1, 9, 1, 2, 1, 2, 3, 2, 3, 4, 3, 4, 5],
      [3, 4, 5, 4, 5, 6, 5, 6, 7, 6, 7, 8, 7, 8, 9],
      [6, 7, 8, 7, 8, 9, 8, 9, 1, 9, 1, 2, 1, 2, 3],
      [9, 1, 2, 1, 2, 3, 2, 3, 4, 3, 4, 5, 4, 5, 6],
      [4, 5, 6, 5, 6, 7, 6, 7, 8, 7, 8, 9, 8, 9, 1],
      [7, 8, 9, 8, 9, 1, 9, 1, 2, 1, 2, 3, 2, 3, 4],
      [1, 2, 3, 2, 3, 4, 3, 4, 5, 4, 5, 6, 5, 6, 7],
      [5, 6, 7, 6, 7, 8, 7, 8, 9, 8, 9, 1, 9, 1, 2],
      [8, 9, 1, 9, 1, 2, 1, 2, 3, 2, 3, 4, 3, 4, 5],
      [2, 3, 4, 3, 4, 5, 4, 5, 6, 5, 6, 7, 6, 7, 8]
    ]

    assert actual == expected
  end

  test "sample secod star" do
    assert Day15.solve2("sample1") == 315
  end

  test "second star" do
    # too low
    assert Day15.solve2("star1") == 1283
  end
end
