defmodule Day11 do
  def solve1(filename) do
    filename
    |> read_input()
  end

  def solve2(filename) do
    filename
    |> read_input()
  end

  def get_value(height_map, x, y) do
    height_map
    |> Enum.at(y)
    |> Enum.at(x)
  end

  def get_dimensions(height_map) do
    {length(Enum.at(height_map, 0)), length(height_map)}
  end

  def next_iteration(height_map) do
    height_map = increment_energy_level(height_map)
    p_height_map = process_flashes(height_map, %{})
  end

  def increment_energy_level(height_map) do
    col_length =
      height_map
      |> Enum.at(0)
      |> length

    height_map_with_y_index = Enum.zip(0..(col_length - 1), height_map)

    Enum.map(height_map_with_y_index, fn {_y, line} ->
      line_with_x_index = Enum.zip(0..(length(line) - 1), line)

      Enum.map(line_with_x_index, fn {_x, value} ->
        value + 1
      end)
    end)
  end

  def process_flashes(height_map, %{} = flashed) do
    col_length =
      height_map
      |> Enum.at(0)
      |> length

    height_map_with_y_index = Enum.zip(0..(col_length - 1), height_map)

    Enum.map(height_map_with_y_index, fn {y, line} ->
      line_with_x_index = Enum.zip(0..(length(line) - 1), line)

      Enum.map(line_with_x_index, fn {x, value} ->
        if value == 9 and flashed[{x, y}] do
          neighbors = get_neighbors(height_map, {x, y})
          new_height_map = increment_energy_level(height_map, neighbors)

          new_flashed = Map.put(flashed, {x, y}, true)
          process_flashes(new_height_map, new_flashed)

          0
        else
          value
        end
      end)
    end)
  end

  def get_neighbors(height_map, {x, y}) do
    dimension_x = length(Enum.at(height_map, 0))
    dimension_y = length(height_map)

    possible_points_with_all_neighbors = [
      {x - 1, y},
      {x + 1, y},
      {x, y - 1},
      {x, y + 1},
      {x - 1, y - 1},
      {x + 1, y + 1}
    ]

    Enum.filter(possible_points_with_all_neighbors, fn {x, y} ->
      x >= 0 and y >= 0 and x < dimension_x and y < dimension_y
    end)
    |> Enum.flat_map(fn x -> x end)
  end

  def read_input(filename) do
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
  end
end
