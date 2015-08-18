module BikesHelper

  def suspension_name bike
    Suspension.find(bike).name
  end

  def sex_name bike
    Sex.find(bike).name
  end

  def type_name bike
    BikeType.find(bike).name
  end

end
