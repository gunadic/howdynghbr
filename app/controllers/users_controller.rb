class UsersController < ApplicationController
  inherit_resources
  actions :index, :show

  def show
  	@user = User.find(params[:id])
  	@past_attended = @user.past_attended
  end

end
