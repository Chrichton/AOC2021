defmodule Day9Test do
  use ExUnit.Case

  test "read_input" do
    actual = Day9.read_input("sample1")

    expected = [
      [2, 1, 9, 9, 9, 4, 3, 2, 1, 0],
      [3, 9, 8, 7, 8, 9, 4, 9, 2, 1],
      [9, 8, 5, 6, 7, 8, 9, 8, 9, 2],
      [8, 7, 6, 7, 8, 9, 6, 7, 8, 9],
      [9, 8, 9, 9, 9, 6, 5, 6, 7, 8]
    ]

    assert actual == expected
  end

  test "get_neighbors" do
    map = [
      [1, 2, 3],
      [3, 4, 5]
    ]

    expected = [
      [
        {{0, 0}, [{1, 0}, {0, 1}]},
        {{0, 1}, [{1, 1}, {0, 0}]}
      ],
      [
        {{1, 0}, [{0, 0}, {2, 0}, {1, 1}]},
        {{1, 1}, [{0, 1}, {2, 1}, {1, 0}]}
      ],
      [
        {{2, 0}, [{1, 0}, {2, 1}]},
        {{2, 1}, [{1, 1}, {2, 0}]}
      ]
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

# height_map = [
#   [2, 1, 9, 9, 9, 4, 3, 2, 1, 0],
#   [3, 9, 8, 7, 8, 9, 4, 9, 2, 1],
#   [9, 8, 5, 6, 7, 8, 9, 8, 9, 2],
#   [8, 7, 6, 7, 8, 9, 6, 7, 8, 9],
#   [9, 8, 9, 9, 9, 6, 5, 6, 7, 8]
# ]

# {2, 3}     = 6
# {2, 4}     = \a
