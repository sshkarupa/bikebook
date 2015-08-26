module BikesHelper

  def suspension_name bike
    Suspension.find(bike).name
  end

  def sex_name bike
    Sex.find(bike).name
  end

  def age_name bike
    Age.find(bike).name
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

  def show_status bike
    if bike.status == 'on_moderation'
      'На модерации'
    elsif bike.status == 'approved'
      'Одобрено'
    elsif bike.status == 'rejected'
      'Отклонено'
    end

  end

end
