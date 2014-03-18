require 'spec_helper'

describe RecordKeeper do
  Given(:keeper){ described_class.new(current_records, game) }
  Given(:game) do
    Game.new({
      :id => 1,
      :course_id => 2,
      :played_at => Time.now,
      :scores => [
        {
          :id => 1,
          :player_id => 1,
          :hole01 => 2,
          :hole02 => 2,
          :hole03 => 2,
          :hole04 => 2,
          :hole05 => 2,
          :hole06 => 2,
          :hole07 => 2,
          :hole08 => 2,
          :hole09 => 2
        },
        {
          :id => 2,
          :player_id => 2,
          :hole01 => 1,
          :hole02 => 2,
          :hole03 => 2,
          :hole04 => 2,
          :hole05 => 2,
          :hole06 => 2,
          :hole07 => 2,
          :hole08 => 2,
          :hole09 => 2
        }
      ]
    })
  end
  context "first game on course" do
    Given(:current_records){ [] }
    When{ keeper.update_records }
    Then{ CourseRecord.count.should == 2 }
    Then do
      first_place = CourseRecord.where(:course_id => 2, :rank => 1).first!
      first_place.player_id.should == 2
      first_place.score.should == 17
      first_place.score_id.should == 2
      first_place.game_id.should == 1
      first_place.played_at.should == game.played_at
    end

    Then do
      second_place = CourseRecord.where(:course_id => 2, :rank => 2).first!
      second_place.player_id.should == 1
      second_place.score.should == 18
      second_place.score_id.should == 1
      second_place.game_id.should == 1
      second_place.played_at.should == game.played_at
    end
  end
end
