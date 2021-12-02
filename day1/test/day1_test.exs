defmodule Day1Test do
  use ExUnit.Case

  test "sample first star" do
    assert Day1.solve1("sample1") == 7
  end

  test "first star" do
    assert Day1.solve1("star1") == 1387
  end

  test "create_successing_windows" do
    actual = Day1.create_successing_windows([199, 200, 208, 210, 200, 207])

    expected = [
      [199, 200, 208],
      [200, 208, 210],
      [208, 210, 200],
      [210, 200, 207]
    ]

    assert actual == expected
  end

  test "create_sliding_windows" do
    # [199, 200, 208, 210, 200, 207]
    actual =
      [199, 200, 208, 210, 200, 207]
      |> Day1.create_sliding_windows()

    expected = [
      {[199, 200, 208], [200, 208, 210]},
      {[200, 208, 210], [208, 210, 200]},
      {[208, 210, 200], [210, 200, 207]}
    ]

    assert actual == expected
  end

  test "sample second star" do
    assert Day1.solve2("sample1") == 5
  end

  test "second star" do
    assert Day1.solve2("star1") == 1362
  end
end
