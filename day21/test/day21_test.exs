defmodule Day21Test do
  use ExUnit.Case

  test "read_input" do
    actual = Day21.read_input("sample1")

    assert actual == {4, 8}
  end

  test "throw_dice" do
    dice = 1..2 |> Stream.cycle()

    {number1, dice2} = Day21.throw_dice(dice)
    {number2, dice3} = Day21.throw_dice(dice2)
    {number3, _} = Day21.throw_dice(dice3)

    assert number1 == 1
    assert number2 == 2
    assert number3 == 1
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
