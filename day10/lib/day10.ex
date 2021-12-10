defmodule Day10 do
  def solve1(filename) do
    filename
    |> read_input()
    |> Enum.filter(fn line ->
      find_corrupted_char(line)
      |> Enum.count() == 1
    end)
    |> Enum.map(fn corrupt_line ->
      [char] = find_corrupted_char(corrupt_line)

      case char do
        ")" -> 3
        "]" -> 57
        "}" -> 1197
        ">" -> 25137
      end
    end)
    |> Enum.sum()
  end

  def chunk_delimiters do
    %{
      "(" => ")",
      "[" => "]",
      "{" => "}",
      "<" => ">"
    }
  end

  def find_corrupted_char(string) do
    close_chars = Map.values(chunk_delimiters())

    string
    |> String.codepoints()
    |> Enum.reduce_while([], fn char, acc ->
      close_char = Map.get(chunk_delimiters(), char)

      if close_char != nil do
        {:cont, [close_char | acc]}
      else
        if char in close_chars do
          [expected_close_char | tail] = acc

          if char != expected_close_char do
            {:halt, [char]}
          else
            {:cont, tail}
          end
        else
          {:cont, acc}
        end
      end
    end)
  end

  def solve2(filename) do
    score_list =
      filename
      |> read_input()
      |> Enum.reject(fn line ->
        find_corrupted_char(line)
        |> Enum.count() == 1
      end)
      |> Enum.map(fn corrupt_line ->
        corrupt_closings = find_corrupted_char(corrupt_line)

        Enum.map(corrupt_closings, fn closing ->
          case closing do
            ")" -> 1
            "]" -> 2
            "}" -> 3
            ">" -> 4
          end
        end)
      end)
      |> Enum.map(fn scores ->
        scores
        |> Enum.reduce(0, fn score, acc ->
          score + acc * 5
        end)
      end)
      |> Enum.sort()

    middle_index = (Enum.count(score_list) / 2) |> trunc()
    Enum.at(score_list, middle_index)
  end

  def read_input(filename) do
    filename
    |> File.read!()
    |> String.split("\n")
  end
end
