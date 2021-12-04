defmodule Day4 do
  def solve1(filename) do
    {numbers, boards} =
      filename
      |> read_input()

    find_first_bingo_board(numbers, 5, boards)
  end

  def find_first_bingo_board(numbers, index, _boards) when index > length(numbers), do: nil

  def find_first_bingo_board(numbers, index, boards) do
    actual_numbers = Enum.take(numbers, index)
    winning_board = find_bingo_board(actual_numbers, boards)

    if winning_board != nil do
      hd(winning_board)
    else
      find_first_bingo_board(numbers, index + 1, boards)
    end
  end

  def find_bingo_board(numbers, boards) do
    transposed_boards =
      boards
      |> Enum.map(&transpose/1)

    bingo_boards =
      boards
      |> Enum.filter(fn board ->
        filtered =
          board
          |> Enum.filter(fn board_numbers ->
            check_numbers_in_board_numbers(numbers, board_numbers)
          end)

        filtered != []
      end)

    if Enum.count(bingo_boards) > 0 do
      Enum.take(bingo_boards, 1)
    else
      bingo_boards =
        transposed_boards
        |> Enum.filter(fn board ->
          filtered =
            board
            |> Enum.filter(fn board_numbers ->
              check_numbers_in_board_numbers(numbers, board_numbers)
            end)

          filtered != []
        end)

      if Enum.count(bingo_boards) > 0 do
        Enum.take(bingo_boards, 1)
      else
        nil
      end
    end
  end

  def check_numbers_in_board_numbers(numbers, board_numbers) do
    board_numbers
    |> Enum.all?(fn board_number ->
      Enum.member?(numbers, board_number)
    end)
  end

  def transpose([]), do: []
  def transpose([[] | _]), do: []

  def transpose(a) do
    [Enum.map(a, &hd/1) | transpose(Enum.map(a, &tl/1))]
  end

  def solve2(filename) do
    filename
    |> read_input()
  end

  def read_input(filename) do
    data =
      File.read!(filename)
      |> String.split("\n")

    numbers =
      data
      |> Enum.take(1)
      |> Enum.at(0)
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)

    boards =
      data
      |> Enum.drop(2)
      |> build_boards([])

    {numbers, boards}
  end

  def build_boards([], boards), do: boards

  def build_boards(data, boards) do
    board =
      data
      |> Enum.take_while(fn element -> element != "" end)
      |> Enum.map(fn string ->
        string
        |> String.split(" ", trim: true)
        |> Enum.map(fn number_string ->
          number_string
          |> String.to_integer()
        end)
      end)

    new_data =
      data
      |> Enum.drop_while(fn element -> element != "" end)
      |> Enum.drop(1)

    build_boards(new_data, [board | boards])
  end
end
