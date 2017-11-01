require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  attr_reader :activity

  def setup
    @activity = Activity.new("Sushi", {name: ["Iza", "Luis"],amount: [30, 40]})
  end

  def test_it_exist
    assert_instance_of Activity, activity
  end

  def test_it_has_a_name
    assert_equal "Sushi", activity.activity
  end

  def test_it_has_participants
    assert_equal ["Iza", "Luis"], activity.names
    assert_equal [30, 40], activity.amount
  end

  def test_it_can_add_participants_to_activity
    activity.add_participants("Miguel", 20)

    assert_equal ["Iza", "Luis", "Miguel"], activity.names
    assert_equal [30, 40, 20], activity.amount
    assert_equal 90, activity.total
  end

  def test_split_the_cost_activity
    activity.add_participants("Miguel", 20)

    assert_equal 30, activity.split_total
  end

  def test_participants_owed_amounts
    activity.add_participants("Miguel", 20)
    
    assert_equal [0, 10, -10], activity.owed_amount
  end

end
