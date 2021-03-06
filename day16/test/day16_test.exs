defmodule Day16Test do
  use ExUnit.Case

  test "lsplit" do
    actual = Day16.lsplit("000123", "0")

    assert actual == "123"
  end

  test "decode_all_values" do
    actual = Day16.decode_all_values("101111111000101000")

    assert actual == 2021
  end

  test "decode_hex" do
    actual = Day16.decode_hex("D2FE28")

    assert actual == "110100101111111000101000"
  end

  test "decode_literal" do
    # assert Day16.decode_literal("11010001010") == 10
    # assert Day16.decode_literal("01010000001") == 1
    # assert Day16.decode_literal("10010000010") == 2
    # assert Day16.decode_literal("00110000011") == 3
    # assert Day16.decode_literal("101001000100100") == 20

    assert Day16.decode_all_values("1000100100") == 20
  end

  test "decode normal package" do
    actual =
      "D2FE28"
      |> Day16.decode_hex()
      |> Day16.decode_binary()

    assert actual == [5]
  end

  # test "decode operator package 0" do
  #   actual =
  #     "38006F45291200"
  #     |> Day16.decode_hex()
  #     |> Day16.decode_binary()

  #   assert actual == [1, 2, 3]
  # end

  test "decode operator package 1" do
    actual =
      "EE00D40C823060"
      |> Day16.decode_hex()
      |> Day16.decode_binary()

    assert actual == [4, 3, 1, 2]
  end

  # test "sample first star" do
  #   assert Day16.solve1("sample1") == 17
  # end

  #   test "first star" do
  #     assert Day16.solve1("star1") == 695
  #   end

  #   test "sample secod star" do
  #     assert Day16.solve2("sample1") == 17
  #   end

  #   test "second star" do
  #     assert Day16.solve2("star1") == nil
  #   end
end
