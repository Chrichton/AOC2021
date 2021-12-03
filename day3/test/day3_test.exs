defmodule Day3Test do
  use ExUnit.Case

  test "sample first star" do
    assert Day3.solve1("sample1") == 198
  end

  test "first star" do
    assert Day3.solve1("star1") == 3_813_416
  end

  test "sample second star" do
    assert Day3.solve2("sample1") == 900
  end

  test "second star" do
    assert Day3.solve2("star1") == 1_568_138_742
  end
end
