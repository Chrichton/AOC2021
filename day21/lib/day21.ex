defmodule Day21 do
  def solve1(filename) do
    filename
    |> read_input()
    |> play_game()
  end

  def play_game({position_player1, position_player2}) do
    dice = Stream.cycle(1..100)
    track_player1 = Stream.cycle(1..10) |> Stream.drop(position_player1 - 1)
    track_player2 = Stream.cycle(1..10) |> Stream.drop(position_player2 - 1)

    # {results, dice} = throw_dice_3_times(dice)
    # {score, track_player1} = move_pawn(track_player1, results)

    # {results, dice} = throw_dice_3_times(dice)
    # {score, track_player2} = move_pawn(track_player2, results)

    1
    |> Stream.cycle()
    |> Enum.reduce_while(
      {0, dice, 0, track_player1, 0, track_player2},
      fn _, {roll_count, dice, score_payer1, track_player1, score_player2, track_player2} ->
        {results, dice} = throw_dice_3_times(dice)
        {actual_score_player1, track_player1} = move_pawn(track_player1, results)

        {results, dice} = throw_dice_3_times(dice)
        {actual_score_player2, track_player2} = move_pawn(track_player2, results)

        {roll_count + 6, dice, score_payer1 + actual_score_player1, track_player1,
         score_player2 + actual_score_player2, track_player2}
      end
    )

    # {number, dice} = throw_dice(dice)
  end

  def move_pawn(track, results) do
    track = Stream.drop(track, results)
    [score] = Enum.take(track, 1)

    {score, track}
  end

  def throw_dice_3_times(dice) do
    1..3
    |> Enum.reduce({0, dice}, fn _, {sum, dice} ->
      {number, dice} = throw_dice(dice)

      {number + sum, dice}
    end)
  end

  def throw_dice(dice) do
    [number] = Enum.take(dice, 1)
    dice_new = Stream.drop(dice, 1)

    {number, dice_new}
  end

  def solve2(filename) do
    filename
    |> read_input()
  end

  def read_input(filename) do
    filename
    |> File.read!()
    |> String.split("\n", trim: true)
    |> then(fn [player1_string, player2_string] ->
      player1_starting_position = parse(player1_string)
      player2_starting_position = parse(player2_string)

      {player1_starting_position, player2_starting_position}
    end)
  end

  def parse(player_string) do
    String.last(player_string)
    |> String.to_integer()
  end
end
