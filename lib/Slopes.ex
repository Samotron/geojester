defmodule Geojester.Slopes do
  def infinite_slope(slope_height, slope_angle, unit_weight, cohesion, friction_angle) do
    angled = Utilities.checkRad(slope_angle)
    phid = Utilities.checkRad(friction_angle)
    cosbeta = :math.cos(angled)
    sinbeta = :math.sin(angled)
    tanphi = :math.tan(phid)
    factor = cosbeta - tanphi * cosbeta
    shear_strength = unit_weight * slope_height * factor
    driving = unit_weight * slope_height * sinbeta
    resisting = cohesion * cosbeta + shear_strength
    resisting / driving
  end
end
