class ProfilesController < ApplicationController
  before_action :set_user

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    # render plain: profile_params
    if @user.update
      set_account_type_role
      @user.save
      respond_to do |format|
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

  def set_account_type_role
    if @user.is_stylist == true
      @user.add_role :stylist
      @user.remove_role :scrub
    elsif @user.is_stylist == false
      @user.add_role :scrub
      @user.remove_role :stylist
    end
  end

end
