defmodule SoilMechanics do
  def k_active(phi) do
    phid = Utilities.checkRad(phi)
    {1 - :math.sin(phid)} / {1 + :math.sin(phid)}
  end

  def k_active(phi, slope) do
    phid = Utilities.checkRad(phi)
    sloped = Utilities.checkRad(slope)
    k_active(phid) / :math.tan(sloped)
  end

  def k_passive(phi) do
    phid = Utilities.checkRad(phi)
    1 / k_active(phi)
  end
end
