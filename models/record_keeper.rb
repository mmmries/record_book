class RecordKeeper
  def initialize(current_records, game)
    @current_records, @game = current_records, game
  end

  def update_records
    CourseRecord.transaction do
      sorted_scores.each_with_index do |score, rank|
        create_record(game, score, rank+1)
      end
    end
  end

  private
  attr_reader :game, :current_records

  def create_record(game, score, rank)
    CourseRecord.create!({
      :course_id => game.course_id,
      :game_id => game.id,
      :score_id => score.id,
      :player_id => score.player_id,
      :played_at => game.played_at,
      :rank => rank,
      :score => score.total,
    })
  end

  def sorted_scores
    game.scores.sort_by(&:total)
  end
end
