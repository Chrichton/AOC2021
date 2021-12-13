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

  # test "sample second star" do
  #   assert Day13.solve2("sample1") == 288_957
  # end

  # test "second star" do
  #   assert Day13.solve2("star1") == 2_429_644_557
  # end
end
