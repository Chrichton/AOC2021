defmodule Day8Test do
  use ExUnit.Case

  test "sample first star" do
    assert Day8.solve1("sample1") == 26
  end

  test "first star" do
    assert Day8.solve1("star1") == 255
  end

  # test "sample second star" do
  #   assert Day8.solve2("sample1") == nil
  # end

  # test "second star" do
  #   assert Day8.solve2("star1") == nil
  # end
end
