defmodule Day21Test do
  use ExUnit.Case

  test "read_input" do
    actual = Day21.read_input("sample1")

    assert actual == {4, 8}
  end

  test "sample first star" do
    assert Day21.solve1("sample1") == 17
  end

  test "first star" do
    assert Day21.solve1("star1") == 695
  end

  test "sample secod star" do
    assert Day21.solve2("sample1") == 17
  end

  test "second star" do
    assert Day21.solve2("star1") == nil
  end
end
