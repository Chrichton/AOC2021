defmodule Day14 do
  def solve1(filename) do
    filename
    |> read_input()
    |> then(fn {template, rules} ->
      build_polymer(template, rules)
    end)
    |> String.length()
  end

  def build_polymer(template, rules) do
    1..10
    |> Enum.reduce(template, fn _step, acc ->
      build_polymer_step(acc, rules)
    end)
  end

  def build_polymer_step(template, rules) do
    template
    |> all_pairs()
    |> Enum.take(3)
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

  def replace_in_template(template, rules, [first_key, second_key, third_key]) do
    first_index = index_of(template, first_key)
    second_index = index_of(template, second_key)
    third_index = index_of(template, third_key)

    result =
      String.slice(template, 0, first_index + 1) <>
        rules[first_key] <> String.slice(template, first_index + 1, String.length(template))

    result =
      String.slice(result, 0, second_index + 2) <>
        rules[second_key] <> String.slice(result, second_index + 2, String.length(result))

    String.slice(result, 0, third_index + 3) <>
      rules[third_key] <> String.slice(result, third_index + 3, String.length(result))
  end

  def all_pairs(string) do
    string
    |> String.codepoints()
    |> Enum.chunk_every(2, 1)
    |> then(fn pairs ->
      pairs
      |> Enum.take(Enum.count(pairs) - 1)
      |> Enum.map(fn [left, right] ->
        left <> right
      end)
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
