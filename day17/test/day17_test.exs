defmodule Day17Test do
  use ExUnit.Case

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
