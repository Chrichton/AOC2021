defmodule Day14 do
  def solve1(filename) do
    filename
    |> read_input()
    |> then(fn {template, rules} ->
      build_polymer(template, rules)
    end)
    |> calculate_quantity_difference()
  end

  def calculate_quantity_difference(polymer_string) do
    polymer_string
    |> String.codepoints()
    |> Enum.frequencies()

    # |> then(fn frequencies_map ->
    #   values = Map.values(frequencies_map)
    #   # Enum.max(values) - Enum.min(values)
    # end)
  end

  def build_polymer(template, rules) do
    1..10
    |> Enum.reduce(template, fn _step, acc ->
      build_polymer_step(acc, rules)
      |> IO.inspect(label: "build_polymer_step")
    end)
  end

  def build_polymer_step(template, rules) do
    template
    |> all_pairs()
    |> then(fn pairs ->
      replace_in_template(template, rules, pairs)
    end)
  end

  def index_of(string, search_string) do
    case :binary.match(
           string,
           search_string
         ) do
      :nomatch -> -1
      result -> result |> elem(0)
    end
  end

  def replace_in_template(template, rules, keys) do
    keys
    |> Enum.map(fn key ->
      {index_of(template, key), key}
    end)
    |> Enum.sort_by(fn {index, _key} -> index end)
    |> Enum.reduce({template, 1}, fn {index, key}, {result, offset} ->
      result =
        String.slice(result, 0, index + offset) <>
          rules[key] <> String.slice(result, index + offset, String.length(result))

      {result, offset + 1}
    end)
    |> elem(0)
  end

  def all_pairs(string) do
    string
    |> String.codepoints()
    |> Enum.chunk_every(2, 1)
    |> then(fn pairs ->
      pairs
      |> Enum.take(Enum.count(pairs) - 1)
      |> Enum.map(&Enum.join/1)
    end)
  end

  def solve2(filename) do
    filename
    |> read_input()
  end

  def read_input(filename) do
    [template | rules] =
      filename
      |> File.read!()
      |> String.split("\n", trim: true)

    rules =
      rules
      |> Enum.map(fn rule_string ->
        String.split(rule_string, " -> ", trim: true)
      end)
      |> Enum.reduce(%{}, fn [source, target], acc ->
        Map.put(acc, source, target)
      end)

    {template, rules}
  end
end
