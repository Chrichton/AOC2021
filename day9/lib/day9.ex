defmodule Day9 do
  def solve1(filename) do
    filename
    |> read_input()
    |> get_risk_levels()

    # |> Enum.sum()
  end

  def get_risk_levels(height_map) do
    get_points_with_neighbors(height_map)
    |> Enum.map(fn {{x, y} = actual_point, neighbors} ->
      {actual_value, neighbor_values} = calculate_values(height_map, {actual_point, neighbors})

      low_point? = actual_value in neighbor_values

      IO.inspect({x, y}, label: "{x,y}")
      IO.inspect(actual_value, label: "actual_value")
      IO.inspect(neighbor_values, label: "neighbor_values")
      IO.inspect(low_point?, label: "low_point?")

      _risk_level =
        if low_point?,
          do: actual_value + 1,
          else: 0
    end)
  end

  def calculate_values(height_map, {{x, y}, neighbors}) do
    actual_value = get_value(height_map, x, y)

    neighbor_values =
      Enum.map(neighbors, fn {nx, ny} ->
        get_value(height_map, nx, ny)
      end)

    {actual_value, neighbor_values}
  end

  def get_points_with_neighbors(height_map) do
    dimension_x = length(Enum.at(height_map, 0))
    dimension_y = length(height_map)

    for x <- 0..(dimension_x - 1) do
      for y <- 0..(dimension_y - 1) do
        possible_points_with_all_neighbors = [
          {x - 1, y},
          {x + 1, y},
          {x, y - 1},
          {x, y + 1}
        ]

        point_with_all_neighbors =
          Enum.filter(possible_points_with_all_neighbors, fn {x, y} ->
            x >= 0 and y >= 0 and x < dimension_x and y < dimension_y
          end)

        {{x, y}, point_with_all_neighbors}
      end
    end
    |> Enum.flat_map(fn x -> x end)
  end

  def get_value(height_map, x, y) do
    height_map
    |> Enum.at(y)
    |> Enum.at(x)
  end

  def solve2(filename) do
    filename
    |> read_input()
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
