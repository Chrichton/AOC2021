defmodule Day17 do
  def solve1(filename) do
    filename
    |> read_input()
    |> input_to_map_set()
  end

  def input_to_map_set([{_x, {from_x, to_x}}, {_y, {from_y, to_y}}]) do
    for x <- from_x..to_x do
      for y <- from_y..to_y do
        {x, y}
      end
    end
    |> Enum.flat_map(fn x -> x end)
    |> Enum.reduce(MapSet.new(), fn {_x, _y} = point, acc ->
      MapSet.put(acc, point)
    end)
  end

  def next_position({x, y} = _point, {vx, vy} = _velocity) do
    next_position = {{x + vx}, {y + vy}}
    next_velocity = {max(vx, vx - 1), vy - 1}

    {next_position, next_velocity}
  end

  def solve2(filename) do
    filename
    |> read_input()
  end

  def read_input(filename) do
    filename
    |> File.read!()
    |> String.replace("target area: ", "")
    |> String.split(",", trim: true)
    |> Enum.map(fn position ->
      String.split(position, "=", trim: true)
      |> then(fn [coordinate, range] ->
        [from_string, to_string] = String.split(range, "..", trim: true)
        from = String.to_integer(from_string)
        to = String.to_integer(to_string)
        {coordinate, {from, to}}
      end)
    end)
  end
end
