module ApplicationHelper
  def human_price price
    number_with_delimiter(price, delimiter: " ") + " руб."
  end
end
