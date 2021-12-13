defmodule Day13 do
  def solve1(filename) do
    {points, _instructions} =
      filename
      |> read_input()

    points
    |> fold_y()

    # |> Enum.count()
  end

  def solve2(filename) do
    filename
    |> read_input()
  end

  def fold_x(points) do
    dimension_x =
      Enum.max_by(points, fn {x, _y} ->
        x
      end)
      |> elem(0)

    fold_x = round(dimension_x / 2)

    left_points =
      points
      |> Enum.filter(fn {x, _y} ->
        x < fold_x
      end)
      |> MapSet.new()

    right_points =
      points
      |> Enum.filter(fn {x, _y} ->
        x > fold_x
      end)

    flipped_right_points =
      right_points
      |> flip_x()
      |> MapSet.new()

    MapSet.union(left_points, flipped_right_points)
  end

  def fold_y(points) do
    dimension_y =
      Enum.max_by(points, fn {_x, y} ->
        y
      end)
      |> elem(1)

    fold_y = round(dimension_y / 2)

    upper_points =
      points
      |> Enum.filter(fn {_x, y} ->
        y < fold_y
      end)
      |> MapSet.new()

    lower_points =
      points
      |> Enum.filter(fn {_x, y} ->
        y > fold_y
      end)

    flipped_lower_points =
      lower_points
      |> flip_y()
      |> MapSet.new()

    IO.inspect(dimension_y, label: "dimension_y")
    IO.inspect(fold_y, label: "fold_y")
    IO.inspect(points, label: "points")
    IO.inspect(upper_points, label: "upper_points")
    IO.inspect(lower_points, label: "lower_points")
    IO.inspect(flipped_lower_points, label: "flipped_lower_points")

    MapSet.union(upper_points, flipped_lower_points)
    |> IO.inspect(label: "result")
  end

  def flip_x(points) do
    max_x =
      Enum.max_by(points, fn {x, _y} ->
        x
      end)
      |> elem(0)

    points
    |> Enum.map(fn {x, y} ->
      new_x = abs(x - max_x)
      {new_x, y}
    end)
  end

  def flip_y(points) do
    max_y =
      Enum.max_by(points, fn {_x, y} ->
        y
      end)
      |> elem(0)

    points
    |> Enum.map(fn {x, y} ->
      new_y = abs(y - max_y)
      {x, new_y}
    end)
  end

  def read_input(filename) do
    lines =
      filename
      |> File.read!()
      |> String.split("\n")

    points =
      lines
      |> Enum.take_while(&(&1 != ""))
      |> Enum.map(fn pair_string ->
        String.split(pair_string, ",")
        |> then(fn [x, y] ->
          {String.to_integer(x), String.to_integer(y)}
        end)
      end)

    instructions =
      lines
      |> Enum.drop_while(&(&1 != ""))
      |> Enum.drop_while(&(&1 == ""))
      |> Enum.map(fn instruction ->
        String.replace(instruction, "fold along ", "")
        |> String.split("=")
        |> then(fn [coord_string, value] ->
          {coord_string, String.to_integer(value)}
        end)
      end)

    {points, instructions}
  end
end

[
  {0, 3},
  {0, 13},
  {0, 14},
  {1, 10},
  {2, 14},
  {3, 0},
  {3, 4},
  {4, 1},
  {4, 11},
  {6, 0},
  {6, 10},
  {6, 12},
  {8, 4},
  {8, 10},
  {9, 0},
  {9, 10},
  {10, 4},
  {10, 12}
]
