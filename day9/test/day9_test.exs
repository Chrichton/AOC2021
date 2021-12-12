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

  test "get_points_with_neighbors" do
    map = [
      [1, 2, 3],
      [3, 4, 5]
    ]

    expected = [
      {{0, 0}, [{1, 0}, {0, 1}]},
      {{1, 0}, [{0, 0}, {2, 0}, {1, 1}]},
      {{2, 0}, [{1, 0}, {2, 1}]},
      {{0, 1}, [{1, 1}, {0, 0}]},
      {{1, 1}, [{0, 1}, {2, 1}, {1, 0}]},
      {{2, 1}, [{1, 1}, {2, 0}]}
    ]

    assert Day9.get_points_with_neighbors(map) == expected
  end

  test "calculate_values" do
    actual =
      Day9.calculate_values(
        [
          [1, 2, 3],
          [3, 4, 5]
        ],
        [{1, 0}, {1, 1}]
      )

    assert actual == [2, 4]
  end

  test "calculate_values single_value" do
    height_map = [
      [0, 0, 9]
    ]

    [actual] = Day9.calculate_values(height_map, [{2, 0}])

    assert actual == 9
  end

  test "get_risk_level low_value" do
    actual =
      Day9.get_risk_level(
        [
          [1, 2, 3],
          [3, 4, 5]
        ],
        {{0, 0}, [{1, 0}, {0, 1}]}
      )

    assert actual == 2
  end

  test "get_risk_level not low_value" do
    actual =
      Day9.get_risk_level(
        [
          [1, 2, 3],
          [3, 4, 5]
        ],
        {{2, 1}, [{2, 0}, {1, 1}]}
      )

    assert actual == 0
  end

  test "sample first star" do
    assert Day9.solve1("sample1") == 15
  end

  test "first star" do
    assert Day9.solve1("star1") == 489
  end

  # --------------------------------------------------

  test "low_point" do
    actual =
      Day9.low_point?(
        [
          [1, 2, 3],
          [3, 4, 5]
        ],
        {{0, 0}, [{1, 0}, {0, 1}]}
      )

    assert actual == true
  end

  test "not low_point" do
    actual =
      Day9.low_point?(
        [
          [1, 2, 3],
          [3, 4, 5]
        ],
        {{2, 1}, [{2, 0}, {1, 1}]}
      )

    assert actual == false
  end

  test "low_points" do
    height_map = [
      [2, 1, 9, 9, 9, 4, 3, 2, 1, 0],
      [3, 9, 8, 7, 8, 9, 4, 9, 2, 1],
      [9, 8, 5, 6, 7, 8, 9, 8, 9, 2],
      [8, 7, 6, 7, 8, 9, 6, 7, 8, 9],
      [9, 8, 9, 9, 9, 6, 5, 6, 7, 8]
    ]

    actual = Day9.get_low_points(height_map)

    assert actual == [{1, 0}, {9, 0}, {2, 2}, {6, 4}]
  end

  test "get_neighbors_9" do
    height_map = [
      [2, 1],
      [3, 9],
      [9, 8]
    ]

    actual = Day9.get_neighbors(height_map, {0, 1}, MapSet.new([]))
    assert actual == MapSet.new([{0, 0}])
  end

  test "calculate_value" do
    actual =
      Day9.calculate_value(
        [
          [1, 2, 3],
          [3, 4, 5]
        ],
        {1, 0}
      )

    assert actual == 2
  end

  test "get_basin" do
    height_map = [
      [2, 1, 9, 9, 9, 4, 3, 2, 1, 0],
      [3, 9, 8, 7, 8, 9, 4, 9, 2, 1],
      [9, 8, 5, 6, 7, 8, 9, 8, 9, 2],
      [8, 7, 6, 7, 8, 9, 6, 7, 8, 9],
      [9, 8, 9, 9, 9, 6, 5, 6, 7, 8]
    ]

    actual = Day9.get_basin(height_map, {0, 0})
    expected = MapSet.new([{0, 0}, {1, 0}, {0, 1}])

    assert actual == expected
  end

  test "sample second star" do
    assert Day9.solve2("sample1") == 1134
  end

  test "second star" do
    assert Day9.solve2("star1") == 1_056_330
  end
end
