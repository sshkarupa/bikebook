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

  def pretty_date date
    if date.today?
      "Сегодня в " + l(date, format: "%H:%M")
    else
      l(date, format: "%d %B %H:%M")
    end
  end

end
