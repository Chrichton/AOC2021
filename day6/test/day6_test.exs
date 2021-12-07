defmodule Day6Test do
  use ExUnit.Case

  test "generation4" do
    actual =
      Day6.generate_lantern_fishs(
        [0, 0, 1, 5, 7, 6, 8],
        1
      )

    # [0,    0,    1, 5, 7, 6, 8]
    # [6, 8, 6, 8, 0, 4, 6, 5, 7]

    expected = [6, 8, 6, 8, 0, 4, 6, 5, 7]

    assert actual == expected
  end

  test "sample first star" do
    assert Day6.solve1("sample1") == 5934
  end

  test "first star" do
    assert Day6.solve1("star1") == 365_862
  end

  test "sample second star" do
    assert Day6.solve2("sample1") == 5
  end

  test "second star" do
    assert Day6.solve2("star1") == 1362
  end
end
