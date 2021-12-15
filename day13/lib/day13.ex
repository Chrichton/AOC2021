defmodule Day13 do
  def solve1(filename) do
    filename
    |> read_input()
    |> then(fn {points, [instruction | _instructions]} ->
      {fold_char, value} = instruction

      case fold_char do
        "x" -> fold_x(points, value)
        "y" -> fold_y(points, value)
      end
    end)
    |> Enum.count()
  end

  def fold_x(points, fold_x) do
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
      |> flip_x(fold_x)
      |> MapSet.new()

    MapSet.union(left_points, flipped_right_points)
  end

  def fold_y(points, fold_y) do
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
      |> flip_y(fold_y)
      |> MapSet.new()

    MapSet.union(upper_points, flipped_lower_points)
  end

  def flip_x(points, fold_x) do
    points
    |> Enum.map(fn {x, y} ->
      new_x = 2 * fold_x - x
      {new_x, y}
    end)
  end

  def flip_y(points, fold_y) do
    points
    |> Enum.map(fn {x, y} ->
      new_y = 2 * fold_y - y
      {x, new_y}
    end)
  end

  def solve2(filename) do
    filename
    |> read_input()
    |> then(fn {points, instructions} ->
      instructions
      |> Enum.reduce(points, fn {fold_char, value}, acc ->
        case fold_char do
          "x" -> fold_x(acc, value)
          "y" -> fold_y(acc, value)
        end
      end)
      |> visualize_puzzle()
    end)
  end

  def visualize_puzzle(points) do
    min_x =
      points
      |> Enum.min_by(fn {x, _y} ->
        x
      end)
      |> elem(0)

    max_x =
      points
      |> Enum.max_by(fn {x, _y} ->
        x
      end)
      |> elem(0)

    min_y =
      points
      |> Enum.min_by(fn {_x, y} ->
        y
      end)
      |> elem(1)

    max_y =
      points
      |> Enum.max_by(fn {_x, y} ->
        y
      end)
      |> elem(1)

    for y <- min_y..max_y do
      for x <- min_x..max_x do
        if MapSet.member?(points, {x, y}),
          do: "#",
          else: "."
      end
      |> Enum.join()
    end
    |> Enum.join("\n")
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
