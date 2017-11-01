require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  attr_reader :activity,
              :reunion,
              :activity_2

  def setup
    @activity = Activity.new("Sushi", {name: ["Iza", "Luis", "Miguel"],amount: [30, 40, 20]})
    @activity_2 = Activity.new("Bowling", {name: ["Iza", "Luis"],amount: [30, 40]} )
    @reunion = Reunion.new("Blue")
  end

  def test_it_has_a_location
    assert_equal "Blue", reunion.location
  end

  def test_it_can_add_activities
    assert_equal 1, reunion.add_activities(activity).count
    assert_equal 2, reunion.add_activities(activity_2).count
  end

  def test_calculates_total_cost_of_reunion
    reunion.add_activities(activity)
    reunion.add_activities(activity_2)

    assert_equal 160, reunion.reunion_total_cost
  end

  def test_split_the_cost_activity
    reunion.add_activities(activity)
    reunion.add_activities(activity_2)

    assert_equal 53, reunion.split_total
  end

  # def test_participants_owed_amounts
  #   reunion.add_activities(activity)
  #   reunion.add_activities(activity_2)
  #   # OUT OF TIME
  #   assert_equal [7, 27, -33], reunion.owed_amount
  # end



end
