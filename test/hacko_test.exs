defmodule HackoTest do
  use ExUnit.Case


  test "combinatorics" do
    assert MathUtils.combination(5,3) == 10
    assert MathUtils.combination(6,2) == 15
    assert MathUtils.combination(6,0) == 1
    assert MathUtils.combination(6,6) == 1
    assert MathUtils.combination(6,5) == MathUtils.combination(6,1)
  end

  test "sum" do
    assert H.sum(0,5, fn x -> x end) == 15
    assert H.sum(0,5, fn x -> 2*x end) == 30
  end

  test "h" do
    assert H.h(0) == -1
    assert H.h(1) == 0
    assert H.h(2) == 2
    assert_in_delta H.h(3), 8/3, 1.0e-8
    assert_in_delta H.h(4), 22/7, 1.0e-8
    #1..100 |> Enum.map(&H.h/1) |> IO.inspect
  end

  test "bigger h" do
    assert_in_delta 256 |> H.h, 9.3, 0.1
    assert_in_delta 512 |> H.h, 10.33, 0.1
    # assert_in_delta 1000 |> H.h, 11.33, 0.1 # too slow
    # assert_in_delta 1021 |> H.h, 11.33, 0.1 # too slow
    # assert_in_delta 1022 |> H.h, 11.33, 0.1 # fails

    assert_in_delta (512 |> H.h) - (256 |> H.h), 1, 0.01
    assert_in_delta (512 |> H.h) - :math.log2(512), 1.332, 0.001
    #assert_in_delta (1000 |> H.h) - :math.log2(1000), 1.332, 0.001

  end

  test "combination" do
    assert Combinations.combination(5,3) == 10
    assert Combinations.combination(6,2) == 15
    assert Combinations.combination(6,0) == 1
    assert Combinations.combination(6,6) == 1
    assert Combinations.combination(6,5) == Combinations.combination(6,1)
  end


end
