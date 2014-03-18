class Score
  include Virtus.model

  attribute :id, Integer
  attribute :player_id, Integer
  attribute :hole01, Integer
  attribute :hole02, Integer
  attribute :hole03, Integer
  attribute :hole04, Integer
  attribute :hole05, Integer
  attribute :hole06, Integer
  attribute :hole07, Integer
  attribute :hole08, Integer
  attribute :hole09, Integer
  attribute :hole10, Integer
  attribute :hole11, Integer
  attribute :hole12, Integer
  attribute :hole13, Integer
  attribute :hole14, Integer
  attribute :hole15, Integer
  attribute :hole16, Integer
  attribute :hole17, Integer
  attribute :hole18, Integer

  def holes
    attributes.select{|k,v| k.to_s.starts_with?("hole")}.map{ |k,v| v }.compact
  end

  def total
    @total ||= holes.sum
  end
end

class Game
  include Virtus.model

  attribute :id, Integer
  attribute :course_id, Integer
  attribute :played_at, DateTime
  attribute :scores, Array[Score]
end
