class TeamsController < ApplicationController
  before_action :set_team, only: [:show]

  def index
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to @team, notice: "your team was created successfully"
    else
      render :new
    end
  end

  def show
  end

  private
    def team_params
      params.require(:team).permit(:name)
    end
    def set_team
      @team = Team.find(params[:id])
    end
end
