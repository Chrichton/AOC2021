defmodule Day14Test do
  use ExUnit.Case
  doctest Day14

  test "sample first star" do
    assert Day14.solve1("sample1") == 17
  end

  test "first star" do
    assert Day14.solve1("star1") == 695
  end

  test "sample secod star" do
    assert Day14.solve2("sample1") == 17
  end

  test "second star" do
    assert Day14.solve2("star1") == nil
  end
end
