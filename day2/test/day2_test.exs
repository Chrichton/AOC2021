defmodule Day2Test do
  use ExUnit.Case

  test "sample first star" do
    assert Day2.solve1("sample1") == 150
  end

  test "first star" do
    assert Day2.solve1("star1") == 1_427_868
  end

  # test "sample second star" do
  #   assert Day1.solve2("sample2") == nil
  # end

  # test "second star" do
  #   assert Day1.solve2("star2") == nil
  # end
end
