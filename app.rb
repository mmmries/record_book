require 'bundler/setup'
Bundler.require

require_relative "course_record"

Rabl.register!

get "/:course_id/records.json" do
  @courses = CourseRecord.where(:course_id => params[:course_id])
  rabl :records
end
