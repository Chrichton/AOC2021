defmodule Day5Test do
  use ExUnit.Case

  test "sample first star" do
    assert Day5.solve1("sample1") == 7
  end

  test "first star" do
    assert Day5.solve1("star1") == 1387
  end

  test "sample second star" do
    assert Day5.solve2("sample1") == 5
  end

  test "second star" do
    assert Day5.solve2("star1") == 1362
  end
end
