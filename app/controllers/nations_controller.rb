class NationsController < ApplicationController
  def index
    @user = current_user
    @nation = @user.nations.last
    if @nation != nil
    @statistics = @nation.statistics.first
    else
      @statistics = nil
    end
  end

  def new
    @user = current_user
    @nation = @user.nations.new
    @statistics = @nation.statistics.new
    
  end

  def create
    @user = current_user
      @nation = @user.nations.new(nation_params)
      if @nation.save
        @statistics = @nation.new_stats
        redirect_to user_nations_path
      else
        render :new
      end
  end

private
  def nation_params
    params.require(:nation).permit(:name, :culture, :govt, :econ, :geo)
  end

  def statistics_params
    params.require(:statistics).permit(:capital, :resources, :population, :stability)
  end
end
