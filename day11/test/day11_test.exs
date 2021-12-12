defmodule Day11Test do
  use ExUnit.Case

  test "increment_energy_level" do
    actual =
      Day11.increment_energy_level([
        [1, 2, 3],
        [4, 5, 6]
      ])

    expected = [
      [2, 3, 4],
      [5, 6, 7]
    ]

    assert actual == expected
  end

  test "increment_energy_level for neighbors" do
    actual =
      Day11.increment_energy_level_for_neighbors(
        [[1, 2, 3], [4, 5, 6]],
        [{2, 1}, {0, 0}]
      )

    expected = [
      [2, 2, 3],
      [4, 5, 7]
    ]

    assert actual == expected
  end

  test "process_flashes" do
    {height_map, %{} = flashed} =
      Day11.process_flashes(
        [[1, 2, 3], [4, 5, 6]],
        %{}
      )

    assert height_map == [[1, 2, 3], [4, 5, 6]]
    assert Map.keys(flashed) == nil
  end

  # test "sample first star" do
  #   assert Day11.solve1("sample1") == 26397
  # end

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
