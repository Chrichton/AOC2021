defmodule Day10Test do
  use ExUnit.Case

  test "sample first star" do
    assert Day10.solve1("sample1") == nil
  end

  test "first star" do
    assert Day10.solve1("star1") == nil
  end

  test "sample second star" do
    assert Day10.solve2("sample1") == nil
  end

  test "second star" do
    assert Day10.solve2("star1") == nil
  end
end
