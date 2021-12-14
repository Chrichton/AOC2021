defmodule Day14Test do
  use ExUnit.Case
  doctest Day14

  test "all_pairs" do
    assert Day14.all_pairs("NNCB") == ["NN", "NC", "CB"]
  end

  test "build_polymer_step" do
    actual =
      Day14.read_input("sample1")
      |> then(fn {template, rules} ->
        Day14.build_polymer_step(template, rules)
      end)

    assert actual == "NCNBCHB"
  end

  test "sample first star" do
    assert Day14.solve1("sample1") == 17
  end

  test "first star" do
    assert Day14.solve1("star1") == 695
  end

  test "sample secod star" do
    assert Day14.solve2("sample1") == 17
  end

  test "second star" do
    assert Day14.solve2("star1") == nil
  end
end
