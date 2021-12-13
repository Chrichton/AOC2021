defmodule Day13Test do
  use ExUnit.Case

  test "fold_x" do
    {points, _instructions} = Day13.read_input("sample1")

    # assert points == nil

    actual = Day13.fold_x(points)

    assert actual == nil
  end

  test "sample first star" do
    assert Day13.solve1("sample1") == 26397
  end

  test "first star" do
    assert Day13.solve1("star1") == 193_275
  end

  # test "sample second star" do
  #   assert Day13.solve2("sample1") == 288_957
  # end

  # test "second star" do
  #   assert Day13.solve2("star1") == 2_429_644_557
  # end
end
