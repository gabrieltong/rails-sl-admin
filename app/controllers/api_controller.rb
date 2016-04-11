# encoding: UTF-8
# user_type 1 代表病人， 2代表医生
class ApiController < ApplicationController
  def create_mobile_file
    params[:mobile_file] = JSON.parse(params[:mobile_file]) if params[:mobile_file].is_a? String
    @mobile_file = MobileFile.new()
    @mobile_file.file = params[:mobile_file]
    if @mobile_file.save
      render_success(@mobile_file)
    else
      render_fail
    end
  end
end
