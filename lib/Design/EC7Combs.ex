defmodule Geojester.Design.EC7Combs do
  @type t :: :Da1C1 | :Da1c2 | :EQU | :None

  @values [:Da1C1, :Da1c2, :EQU, :None]

  def values, do: @values
end

defmodule Geojester.Design.EC7PartialFactors do
  @moduledoc """
  Generates partial factors from different combinations
  """

  @default_values %{
    gamma_g_unfav: 1.0,
    gamma_g_fav: 1.0,
    gamma_q_unfav: 1.0,
    gamma_q_fav: 1.0,
    gamma_phi: 1.0,
    gamma_c_prime: 1.0,
    gamma_cu: 1.0,
    gamma_gamma: 1.0,
    gamma_qu: 1.0
  }

  def new(comb) do
    @default_values
    |> update_factors(comb)
  end

  defp update_factors(factors, :Da1C1) do
    Map.merge(factors, %{
      gamma_g_fav: 1.0,
      gamma_g_unfav: 1.35,
      gamma_q_unfav: 1.5
    })
  end

  defp update_factors(factors, :Da1c2) do
    Map.merge(factors, %{
      gamma_q_unfav: 1.3,
      gamma_phi: 1.25,
      gamma_c_prime: 1.25,
      gamma_cu: 1.4,
      gamma_qu: 1.4
    })
  end

  defp update_factors(factors, :EQU) do
    Map.merge(factors, %{
      gamma_g_unfav: 1.1,
      gamma_g_fav: 0.9,
      gamma_q_unfav: 1.5,
      gamma_c_prime: 1.25,
      gamma_phi: 1.25,
      gamma_cu: 1.4,
      gamma_qu: 1.4
    })
  end

  defp update_factors(factors, :None), do: factors
end
