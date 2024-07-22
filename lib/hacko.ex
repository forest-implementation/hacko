defmodule MathUtils do
  def combination(n, k) when k == 0 or k == n, do: 1
  def combination(n, k) when k > n, do: 0
  def combination(n, k) do
    factorial(n) / (factorial(k) * factorial(n - k))
  end

  defp factorial(0), do: 1
  defp factorial(n) when n > 0, do: n * factorial(n - 1)
end


defmodule Combinations do
  @moduledoc """
    Computes faster combination, without factorial
  """
  defp compute_combination(_n, 0), do: 1
  defp compute_combination(n, k) when k > n - k, do: compute_combination(n, n - k)
  defp compute_combination(n, k) do
    Enum.reduce(0..(k - 1), 1, fn i, acc -> div(acc * (n - i), (i + 1)) end)
  end

  def combination(n, k) do
    if k > n do
      0
    else
      compute_combination(n, k)
    end
  end

end



defmodule H do
  use Memoize

  def sum(l, n, foo), do: l..n |> Stream.map(foo) |> Enum.sum

  defmemo h(1), do: 0

  defmemo h(n), do: 1+(1+sum(0,n-2, fn l -> Combinations.combination(n-1, l) * h(l+1) end)) / (2**(n-1)-1)
end
