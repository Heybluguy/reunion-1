require "pry"
class Activity
    attr_reader :activity,
                :amount,
                :names,
                :total

  def initialize(activity, participants = {})
    @activity = activity
    @amount   = participants[:amount]
    @names    = participants[:name]
    @total    = amount.sum

  end

  def add_participants(name, amount)
    @names.push(name)
    @amount.push(amount)
    @total += amount
  end

  def split_total
    total/names.count
  end

  def owed_amount
    amount.map do |bill|
      bill-split_total
    end
  end
  
end
