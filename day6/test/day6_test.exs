defmodule Day6Test do
  use ExUnit.Case

  test "sample first star" do
    assert Day6.solve1("sample1") == 5
  end

  test "first star" do
    assert Day6.solve1("star1") == 1387
  end

  test "sample second star" do
    assert Day6.solve2("sample1") == 5
  end

  test "second star" do
    assert Day6.solve2("star1") == 1362
  end
end
