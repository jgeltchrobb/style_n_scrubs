class ProfilesController < ApplicationController
  before_action :set_user

  def index
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(profile_params)
        set_account_type_role
        @user.save
        format.html { redirect_to profile_path, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: profiles_path }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end     
    end   
  end

  private

  def set_user
    @user = current_user
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:user).permit(:id, :username, :bio, :profile_pic, :is_stylist)
  end

  def set_account_type_role
    if @user.is_stylist == true
      @user.remove_role :scrub
      @user.add_role :stylist
    elsif @user.is_stylist == false
      @user.remove_role :stylist
      @user.add_role :scrub
    end
  end

end
