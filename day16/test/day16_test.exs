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

  test "decode normal package" do
    actual =
      "D2FE28"
      |> Day16.decode_hex()
      |> Day16.decode_binary()

    assert actual == 5
  end

  # test "decode operator package" do
  #   actual =
  #     "00111000000000000110111101000101001010010001001000000000"
  #     |> Day16.decode_hex()
  #     |> Day16.decode_binary()

  #   assert actual == 5
  # end

  test "sample first star" do
    assert Day16.solve1("sample1") == 17
  end

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