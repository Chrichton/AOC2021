defmodule Day5 do
  def solve1(filename) do
    filename
    |> read_input()
  end

  def points_in_line({fx, _fy} = from, {tx, _ty} = to) do
    line = from_to(from, to)
    # step = unit_vector(line)

    slope = slope(from, to)
    range = {fx + 1, tx}

    require IEx
    IEx.pry()

    points_in_line([from], to, slope, range)
  end

  def points_in_line(from, _to, _slope, {x, to_x} = _range)
      when is_list(from) and x > to_x,
      do: from |> Enum.reverse()

  def points_in_line([{lx, ly} = _last_value | _] = from, to, slope, {x, to_x} = _range)
      when is_list(from) do
    y =
      (slope * (x - lx) + ly)
      |> round()

    require IEx
    IEx.pry()

    points_in_line([{x, y} | from], to, slope, {x + 1, to_x})
  end

  def slope({x1, y1} = _from, {x2, y2} = _to), do: (x2 - x1) / (y2 - y1)

  def from_to({x1, y1}, {x2, y2}), do: {x2 - x1, y2 - y1}

  def unit_vector({x, y} = v) do
    v
    |> norm()
    |> then(fn norm -> {x / norm, y / norm} end)
  end

  def norm({x, y}), do: :math.sqrt(x * x + y * y)

  def solve2(filename) do
    filename
    |> read_input()
  end

  def read_input(filename) do
    File.read!(filename)
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
  end
end
