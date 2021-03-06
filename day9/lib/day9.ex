defmodule Day9 do
  def solve1(filename) do
    filename
    |> read_input()
    |> get_risk_levels()
    |> Enum.sum()
  end

  def get_risk_levels(height_map) do
    get_points_with_neighbors(height_map)
    |> Enum.map(fn {{_x, _y} = actual_point, neighbors} ->
      get_risk_level(height_map, {actual_point, neighbors})
    end)
  end

  def get_risk_level(height_map, {{_x, _y} = point, neighbors}) do
    actual_value = calculate_value(height_map, point)
    neighbor_values = calculate_values(height_map, neighbors)

    low_point? = Enum.all?(neighbor_values, &(actual_value < &1))

    _risk_level =
      if low_point?,
        do: actual_value + 1,
        else: 0
  end

  def calculate_values(height_map, neighbors) do
    Enum.map(neighbors, fn {x, y} ->
      get_value(height_map, x, y)
    end)
  end

  def calculate_value(height_map, {_x, _y} = point) do
    calculate_values(height_map, [point])
    |> hd
  end

  def get_points_with_neighbors(height_map) do
    dimension_x = length(Enum.at(height_map, 0))
    dimension_y = length(height_map)

    for y <- 0..(dimension_y - 1) do
      for x <- 0..(dimension_x - 1) do
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

  # ----------------------------------------------------------------

  def solve2(filename) do
    height_map =
      filename
      |> read_input()

    height_map
    |> get_low_points()
    |> Enum.map(&(get_basin(height_map, &1) |> Enum.count()))
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.reduce(1, fn n, acc -> n * acc end)
  end

  def get_basin(height_map, {x, y} = low_point) do
    neighbors = get_neighbors(height_map, {x, y}, MapSet.new([]))
    visits = MapSet.new([low_point])

    traverse(height_map, neighbors, visits)
  end

  def traverse(height_map, neighbors, visits) do
    neighbors
    |> Enum.reduce(visits, fn {_x, _y} = point, previous_visits ->
      point_neighbors = get_neighbors(height_map, point, previous_visits)

      traverse(height_map, point_neighbors, MapSet.put(previous_visits, point))
    end)
  end

  def get_neighbors(height_map, {x, y}, previous_visits) do
    dimension_x = length(Enum.at(height_map, 0))
    dimension_y = length(height_map)

    [{x - 1, y}, {x + 1, y}, {x, y - 1}, {x, y + 1}]
    |> Enum.filter(fn {x, y} ->
      x >= 0 and y >= 0 and x < dimension_x and y < dimension_y and
        calculate_value(height_map, {x, y}) != 9
    end)
    |> MapSet.new()
    |> MapSet.difference(previous_visits)
  end

  def get_low_points(height_map) do
    get_points_with_neighbors(height_map)
    |> Enum.filter(fn {{_x, _y} = actual_point, neighbors} ->
      low_point?(height_map, {actual_point, neighbors})
    end)
    |> Enum.map(fn {{_x, _y} = actual_point, _neighbors} ->
      actual_point
    end)
  end

  def low_point?(height_map, {{_x, _y} = point, neighbors}) do
    actual_value = calculate_value(height_map, point)
    neighbor_values = calculate_values(height_map, neighbors)

    Enum.all?(neighbor_values, &(actual_value < &1))
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
