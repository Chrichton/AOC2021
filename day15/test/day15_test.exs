defmodule Day15Test do
  use ExUnit.Case

  test "sample first star" do
    assert Day15.solve1("sample1") == 40
  end

  test "first star" do
    # too high
    assert Day15.solve1("star1") == 402
  end

  test "sample secod star" do
    assert Day15.solve2("sample1") == 17
  end

  test "second star" do
    assert Day15.solve2("star1") == nil
  end
end
