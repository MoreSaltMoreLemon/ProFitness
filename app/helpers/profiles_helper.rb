module ProfilesHelper
  def convert_to_kg(lbs)
    (lbs.to_f * 0.453592).round(2)
  end

  def convert_to_lbs(kgs)
    (kgs.to_f * 2.20462).round(2)
  end

  def convert_to_meters(feet)
    (feet.to_f * 0.3048).round(2)
  end

  def convert_to_feet(meters)
    (meters.to_f * 3.28084).round(2)
  end
end
