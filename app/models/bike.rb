class Bike < ActiveRecord::Base
  belongs_to :user
  validates :bike_type, :title, :price, presence: true

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }#, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  class << self
    def bikes_type
      [
          ['Горный велосипед', 'mountain'],
          ['Городской велосипед', 'utility'],
          ['Шоссейный велосипед', 'racing'],
          ['Гибридный велосипед', 'hybrid'],
          ['MTB', 'mtb'],
          ['BMX', 'bmx'],
          ['29er', '29er'],
          ['Фэт-байк', 'fat'],
          ['Электровелосипед', 'electro']
      ]
    end

    def gears
      30.downto 1
    end

    def wheels
      29.downto 1
    end

    def suspension
      [
          ['С двумя амортизаторами', 'two_susp'],
          ['C одним амортизатором', 'hardtail'],
          ['Без амортизаторов', 'rigid']
      ]
    end

    def sex
      [
          ['Мужской', 'men'],
          ['Женский', 'women'],
          ['Юнисекс', 'unisex'],
          ['Детский', 'kid']
      ]
    end
  end
end
