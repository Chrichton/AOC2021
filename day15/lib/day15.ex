defmodule Day15 do
  def solve1(filename) do
    filename
    |> read_input()
    |> find_lowest_risk_path()
  end

  def find_lowest_risk_path(height_map) do
    start_point = {0, 0}

    traverse(
      height_map,
      [start_point],
      %{}
    )
  end

  def traverse(_height_map, [], visits) do
    visits
    |> IO.inspect(label: "visits---------")
  end

  def traverse(height_map, points, visits) do
    Enum.map(points, fn {_x, _y} = point ->
      visits =
        Map.get_and_update(visits, point, fn current_value ->
          if current_value == nil do
            {current_value, get_value(height_map, point)}
          else
            {current_value, current_value + get_value(height_map, point)}
          end
        end)
        |> elem(1)

      neighbors = get_neighbors(height_map, point, visits) |> IO.inspect(label: "neighbors")

      traverse(height_map, neighbors, visits)
    end)
  end

  def get_value(height_map, {x, y}) do
    height_map
    |> Enum.at(y)
    |> Enum.at(x)
  end

  def get_neighbors(height_map, {x, y}, previous_visits) do
    dimension_x = length(Enum.at(height_map, 0))
    dimension_y = length(height_map)

    [{x - 1, y}, {x + 1, y}, {x, y - 1}, {x, y + 1}]
    |> Enum.filter(fn {x, y} ->
      x >= 0 and y >= 0 and x < dimension_x and y < dimension_y
    end)
    |> MapSet.new()
    |> MapSet.difference(get_points(previous_visits))
    |> MapSet.to_list()
  end

  def get_points(%{} = visits) do
    Map.keys(visits)
    |> MapSet.new()
  end

  def solve2(filename) do
    filename
    |> read_input()
  end

  def read_input(filename) do
    filename
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      line
      |> String.codepoints()
      |> Enum.map(fn number_char ->
        String.to_integer(number_char)
      end)
    end)
  end
end
