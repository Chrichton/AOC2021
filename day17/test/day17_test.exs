defmodule Day17Test do
  use ExUnit.Case

  test "read_input" do
    actual = Day17.read_input("sample1")

    assert actual == [{"x", {20, 30}}, {" y", {-10, -5}}]
  end

  test "input_to_map_set" do
    actual =
      [{"x", {0, 1}}, {"y", {2, 3}}]
      |> Day17.input_to_map_set()
      |> MapSet.to_list()

    assert actual == [{0, 2}, {0, 3}, {1, 2}, {1, 3}]
  end

  test "sample first star" do
    assert Day17.solve1("sample1") == 17
  end

  test "first star" do
    assert Day17.solve1("star1") == 695
  end

  test "sample secod star" do
    assert Day17.solve2("sample1") == 17
  end

  test "second star" do
    assert Day17.solve2("star1") == nil
  end
end
