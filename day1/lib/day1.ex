defmodule Day1 do
  def solve1(filename) do
    filename
    |> read_input()
    |> Enum.reduce({0, 0}, fn depth, {increase_count, last_depth} ->
      if depth > last_depth,
        do: {increase_count + 1, depth},
        else: {increase_count, depth}
    end)
  end

  def solve2(filename) do
    filename
    |> read_input()
    |> create_sliding_windows()
    |> Enum.filter(fn {previous_window, window} ->
      Enum.sum(window) > Enum.sum(previous_window)
    end)
    |> Enum.count()
  end

  def create_successing_windows(depths) do
    first3 =
      depths
      |> Enum.take(3)
      |> Enum.reverse()

    if Enum.count(first3) == 3 do
      Enum.drop(depths, 3)
      |> Enum.reduce([first3], fn depth, [last3 | _] = acc ->
        next3 = [depth | Enum.take(last3, 2)]
        [next3 | acc]
      end)
      |> Enum.reverse()
      |> Enum.map(&Enum.reverse/1)
    else
      []
    end
  end

  def create_sliding_windows(depths) do
    all_windows = create_successing_windows(depths)

    if Enum.count(all_windows) > 0 do
      first_window = Enum.take(all_windows, 1)

      all_windows
      |> Enum.reduce([{first_window, nil}], fn window, [{last_window, _} | _] = acc ->
        [{window, last_window} | acc]
      end)
      |> Enum.map(fn {window, last_window} ->
        {last_window, window}
      end)
      |> Enum.reverse()
      |> Enum.drop(1)
      |> Enum.drop(1)
    else
      []
    end
  end

  def read_input(filename) do
    File.read!(filename)
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
  end
end
