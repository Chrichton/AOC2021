defmodule Day7Test do
  use ExUnit.Case
  doctest Day7

  test "sample first star" do
    assert Day7.solve1("sample1") == 37
  end

  test "first star" do
    assert Day7.solve1("star1") == 352_997
  end

  # test "sample second star" do
  #   assert Day7.solve2("sample1") == nil
  # end

  # test "second star" do
  #   assert Day7.solve2("star1") == nil
  # end
end
