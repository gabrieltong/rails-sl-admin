# encoding: UTF-8
# user_type 1 代表病人， 2代表医生
class ApiController < ApplicationController
  skip_before_filter :verify_authenticity_token

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

private
  def person_params
    params.require(:mobile_file).permit(:file)
  end

  def render_success(msg='')
    render json: {:result=>1,:msg=>msg}
  end

  def render_fail(msg='')
    render json: {:result=>0,:msg=>msg}
  end
end
