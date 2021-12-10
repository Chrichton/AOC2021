defmodule Day9 do
  def solve1(filename) do
    filename
    |> read_input()
    |> test()
    # |> get_risk_levels()
    |> Enum.sum()
  end

  def test(m) do
    IO.inspect(m, label: "m\n")
  end

  def get_risk_levels(height_map) do
    IO.inspect(height_map, label: "height_map\n")

    get_neighbors(height_map)
    |> Enum.map(fn neighbors_row ->
      Enum.map(neighbors_row, fn {{x, y}, neighbors} ->
        neighbor_values =
          Enum.map(neighbors, fn {nx, ny} ->
            get_value(height_map, nx, ny)
          end)

        actual_value = get_value(height_map, x, y)
        low_point? = actual_value in neighbor_values

        _risk_level =
          if low_point?,
            do: actual_value + 1,
            else: 0
      end)
    end)
  end

  def get_neighbors(height_map) do
    dimension_x = length(Enum.at(height_map, 0))
    dimension_y = length(height_map)

    for x <- 0..(dimension_x - 1) do
      for y <- 0..(dimension_y - 1) do
        possible_neighbors = [
          {x - 1, y},
          {x + 1, y},
          {x, y - 1},
          {x, y + 1}
        ]

        neighbors =
          Enum.filter(possible_neighbors, fn {x, y} ->
            x >= 0 and y >= 0 and x < dimension_x and y < dimension_y
          end)

        {{x, y}, neighbors}
      end
    end
  end

  def get_value(height_map, x, y) do
    height_map
    |> Enum.at(x)
    |> Enum.at(y)
  end

  def solve2(filename) do
    filename
    |> read_input()
  end

  def read_input(filename) do
    result =
      filename
      |> File.read!()
      |> String.split("\n")
      |> Enum.map(fn line ->
        String.codepoints(line)
        |> Enum.reduce([], fn char, acc ->
          [String.to_integer(char) | acc]
        end)
        |> Enum.reverse()
      end)

    IO.inspect(result, label: "result\n")
  end
end
