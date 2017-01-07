class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy, :search_teams, :update_teams]
  before_action :set_tournament, only: [:index, :new, :create]
  before_action :set_team, only: [:update_teams]

  # GET /groups
  # GET /groups.json
  def index
    @groups = @tournament.groups
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = @tournament.groups.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = @tournament.groups.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to edit_group_path(@group), notice: t('controllers.group.create') }
        format.json { render :show, status: :created, location: @tournament }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: t('controllers.group.update') }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to @group.tournament, notice: t('controllers.group.destroy') }
      format.json { head :no_content }
    end
  end

  def search_teams
    teams = []
    teams = Team.excepting(@group.teams).order(:name).by_name(params[:q]).limit(15) if params[:q].present?
    render json: teams.map { |p| {id: p.id, name: p.name, avatar: p.avatar.url(:thumb)} }
  end

  def update_teams
    @group.update_team_list @team, params[:team].try(:[], :action)
    respond_to do |format|
      format.html { redirect_to group_path(@group), notice: t('controllers.team.team_list_update') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name)
    end

    def set_tournament
      @tournament = Tournament.find(params[:tournament_id])
    end

    def set_team
      @team = Team.find params[:team].try(:[], :id)
    end
end
