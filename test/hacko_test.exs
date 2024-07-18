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
    1..100 |> Enum.map(&H.h/1) |> IO.inspect
  end

  test "frac" do
    assert Fraction.add(1,0) == %Fraction{numerator: 1, denominator: 1}
    Fraction.add(Fraction.new(1,1), Fraction.new(1,1)) |> IO.inspect
  end


end
