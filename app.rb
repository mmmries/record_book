require 'bundler/setup'
Bundler.require

require_relative "models/course_record"
require_relative "models/game"

Rabl.register!

get "/:course_id/records.json" do
  @courses = CourseRecord.where(:course_id => params[:course_id])
  rabl :records
end

post "/game.json" do
  game = Game.new(JSON.parse(request.body.read))
  # update
  status 200
  body ""
end
