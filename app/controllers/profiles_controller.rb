class ProfilesController < ApplicationController
  before_action :set_user

  def index
  end

  private

  def set_user
    @user = current_user
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:user).permit(:id)
  end

end
