defmodule Parameters do
  @moduledoc """
  Functions to help with calculating parameter
  """

  def stroud_f1(plastInd) do
    min(7.0, 4.36 + 8910 / :math.pow(plastInd, 3.0))
  end

  def bs8002_phi_angle_crit(plastInd) do
    case plastInd do
      x when x >= 5 and x <= 100 -> 42.0 - 12.5 * :math.log10(plastInd)
      _ -> 0.0
    end
  end

  defp vertical_effective_stress_cohesion_relation(plastInd) do
    0.11 + 0.0037 * plastInd
  end

  def cu_from_plast_ind_eff_stress(plastInd, effStress) do
    effStress * vertical_effective_stress_cohesion_relation(plastInd)
  end
end
