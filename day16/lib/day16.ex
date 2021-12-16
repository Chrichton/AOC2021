defmodule Day16 do
  def solve1(filename) do
    filename
    |> read_input()
    |> Enum.map(&decode_hex/1)
    |> Enum.map(&decode_binary/1)
  end

  def decode_hex(hex_string) do
    Base.decode16!(hex_string)
    |> :binary.bin_to_list()
    |> Enum.reduce("", fn number, acc ->
      binary_string =
        number
        |> Integer.to_string(2)
        |> String.pad_leading(8, "0")

      acc <> binary_string
    end)
  end

  def decode_binary(binary_string) do
    packet_version =
      binary_string
      |> String.slice(3, String.length(binary_string))
      |> String.slice(3, 3)
      |> String.to_integer(2)

    # packet_type_id =
    #   binary_string
    #   |> Enum.take(3)
    #   |> String.to_integer(2)

    # if packet_type_id == 4 do
    #   decode_all_values(Enum.drop(binary_string, 6))
    # else
    # end
  end

  def decode_all_values(binary_string) do
    binary_string
    |> String.codepoints()
    |> Enum.chunk_every(5)
    |> Enum.map(&Enum.join/1)
    |> Enum.reduce("", fn group, acc ->
      if Enum.all?(String.codepoints(group), fn char -> char == "0" end) do
        acc
      else
        acc <> String.slice(group, 1, String.length(group))
      end
    end)
    |> String.to_integer(2)
  end

  def lsplit(string, char) do
    if String.slice(string, 0, 1) == char,
      do: lsplit(String.slice(string, 1, String.length(string)), char),
      else: string
  end

  def solve2(filename) do
    filename
    |> read_input()
  end

  def read_input(filename) do
    filename
    |> File.read!()
    |> String.codepoints()
    |> Enum.chunk_every(6)
    |> Enum.map(&Enum.join/1)
  end
end

"""
["10111", "11110", "00101", "000"]
10111 11110 00101 000


01111110
011111100101
"""
