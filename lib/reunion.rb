require 'pry'

class Reunion
    attr_reader :activities,
                :location

  def initialize(location, activities=[])
    @activities = activities
    @location = location
  end

  def add_activities(activity)
    @activities << activity
  end

  def reunion_total_cost
    @activities.map do |activity|
      activity.total
    end.sum
  end

  def split_total
    reunion_total_cost/@activities.map do |activity|
      activity.names
    end.flatten.uniq.count
  end

  # def owed_amount
  #   @activities[0].amounts.merge(@activities[1].amounts) do |key, first_amount, second_amount|
  #    first_amount + second_amount
  #  end
  #  owed_amount.each do |key, value|
  #  end #OUT OF TIME
  # end


end
