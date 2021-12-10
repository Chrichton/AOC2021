defmodule Day10Test do
  use ExUnit.Case

  test "find first corrupt character" do
    assert Day10.find_corrupted_char("{([(<{}[<>[]}>{[]{[(<()>") == ["}"]
    assert Day10.find_corrupted_char("[[<[([]))<([[{}[[()]]]") == [")"]

    assert Day10.find_corrupted_char("<{([{{}}[<[[[<>{}]]]>[]]")
           |> Enum.count() > 1
  end

  test "sample first star" do
    assert Day10.solve1("sample1") == 26397
  end

  test "first star" do
    assert Day10.solve1("star1") == 193_275
  end

  test "sample second star" do
    assert Day10.solve2("sample1") == 288_957
  end

  test "second star" do
    assert Day10.solve2("star1") == 2_429_644_557
  end
end
