defmodule Day13Test do
  use ExUnit.Case

  test "fold_y" do
    {points, _instructions} = Day13.read_input("sample1")

    actual =
      points
      |> Day13.fold_y(7)
      |> Enum.count()

    assert actual == 17
  end

  test "fold_y, fold_x" do
    {points, _instructions} = Day13.read_input("sample1")

    actual =
      points
      |> Day13.fold_y(7)
      |> Day13.fold_x(5)
      |> Enum.count()

    assert actual == 16
  end

  test "sample first star" do
    assert Day13.solve1("sample1") == 17
  end

  test "first star" do
    assert Day13.solve1("star1") == 695
  end

  test "sample second star" do
    actual = Day13.solve2("sample1")

    expected = """
    #####
    #...#
    #...#
    #...#
    #####\
    """

    assert actual == expected
  end

  test "second star" do
    actual = Day13.solve2("star1")

    expected = """
    .##....##.####..##..#....#..#.###....##
    #..#....#....#.#..#.#....#..#.#..#....#
    #.......#...#..#....#....#..#.#..#....#
    #.##....#..#...#.##.#....#..#.###.....#
    #..#.#..#.#....#..#.#....#..#.#....#..#
    .###..##..####..###.####..##..#.....##.\
    """

    assert actual == expected
  end
end

"JZGLUPJ"
