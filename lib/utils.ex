defmodule Geojester.Utilities do
  @moduledoc """
  Functions to help with common tasks
  """
  def checkRad(phi) do
    case phi do
      x when x < 2 -> x
      _ -> phi * :math.pi / 180
    end
  end
end
