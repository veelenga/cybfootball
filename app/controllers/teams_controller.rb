class TeamsController < ApplicationController
  before_action :store_per_page, only: [:index, :show]
  before_action :set_team, only: [:show, :edit, :update, :destroy, :update_players]
  before_action :set_player, only: [:update_players]

  # GET /teams
  # GET /teams.json
  def index
    scope = Team.order(:created_at)
    scope = scope.by_name params[:search] if params[:search]
    @teams = scope.page(params[:page]).per(params[:per])
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @team_players = @team.players.order(:fio).page(params[:page]).per(params[:per])
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: t('controllers.team.create') }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: t('controllers.team.update') }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: t('controllers.team.destroy') }
      format.json { head :no_content }
    end
  end

  def update_players
    if @player.present?
      @team.update_players_list @player, params[:player].try(:[], :action)
      respond_to do |format|
        format.html { redirect_to team_path(@team), notice: t('controllers.team.player_list_update') }
        format.json { head :no_content }
      end
    else
      redirect_to team_path(@team)
    end
  end

  private
    def set_team
      @team = Team.find params[:id]
    end

    def set_player
      @player = Player.find_by_id params[:player].try(:[], :id)
    end

    def team_params
      params.require(:team).permit(:name, :avatar, :crop_x, :crop_y, :crop_w, :crop_h, :crop_r)
    end
end
