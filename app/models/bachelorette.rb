class Bachelorette <ApplicationRecord
  has_many :contestants

  def contestants_average_age
    contestants.average(:age)
  end

  def contestants_home_town
    contestants.order(hometown: :asc).distinct.pluck(:hometown)
  end
end
