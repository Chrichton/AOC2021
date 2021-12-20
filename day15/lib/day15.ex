defmodule Day15 do
  def solve1(filename) do
    filename
    |> read_input()
    |> then(fn height_map ->
      height_map
      |> find_lowest_risk_path()
      |> Enum.drop(1)
      |> Enum.map(fn {_x, _y} = point ->
        get_value(height_map, point)
      end)
      |> Enum.sum()
    end)
  end

  def find_lowest_risk_path(height_map) do
    dimension_x = length(Enum.at(height_map, 0))
    dimension_y = length(height_map)

    start_point = {0, 0}
    end_point = {dimension_x - 1, dimension_y - 1}

    all_points(height_map)
    |> Enum.reduce(Graph.new(), fn {_x, _y} = point, graph ->
      get_neighbors(height_map, point)
      |> Enum.reduce(graph, fn {_xn, _yn} = neighbor, graph ->
        Graph.add_edge(graph, point, neighbor, weight: get_value(height_map, neighbor))
      end)
    end)
    |> Graph.get_shortest_path(start_point, end_point)
  end

  def get_value(height_map, {x, y}) do
    height_map
    |> Enum.at(y)
    |> Enum.at(x)
  end

  def all_points(height_map) do
    dimension_x = length(Enum.at(height_map, 0))
    dimension_y = length(height_map)

    for x <- 0..(dimension_x - 1) do
      for y <- 0..(dimension_y - 1) do
        {x, y}
      end
    end
    |> Enum.flat_map(fn x -> x end)
  end

  def get_neighbors(height_map, {x, y}) do
    dimension_x = length(Enum.at(height_map, 0))
    dimension_y = length(height_map)

    [{x - 1, y}, {x + 1, y}, {x, y - 1}, {x, y + 1}]
    |> Enum.filter(fn {x, y} ->
      x >= 0 and y >= 0 and x < dimension_x and y < dimension_y
    end)
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
