defmodule Day5Test do
  use ExUnit.Case

  test "norm" do
    assert Day5.norm({2, 0}) == 2
  end

  test "unit_vector" do
    assert Day5.unit_vector({2, 0}) == {1, 0}
    assert Day5.unit_vector({0, 2}) == {0, 1}

    actual =
      {4, 5}
      |> Day5.unit_vector()
      |> Day5.norm()
      |> Float.round()

    assert actual == 1
  end

  test "from to" do
    assert Day5.from_to({2, 0}, {6, 4}) == {4, 4}
  end

  test "points_in_line_easy" do
    assert Day5.points_in_line({0, 1}, {0, 3}) == [
             {0, 1},
             {0, 2},
             {0, 3}
           ]
  end

  test "points_in_line_hard" do
    actual = Day5.points_in_line({2, 0}, {6, 4})

    expected = [
      {2, 0},
      {3, 1},
      {4, 2},
      {5, 3},
      {6, 4}
    ]

    assert actual == expected
  end

  # test "sample first star" do
  #   assert Day5.solve1("sample1") == 5
  # end

  # test "first star" do
  #   assert Day5.solve1("star1") == 1387
  # end

  # test "sample second star" do
  #   assert Day5.solve2("sample1") == 5
  # end

  # test "second star" do
  #   assert Day5.solve2("star1") == 1362
  # end
end
