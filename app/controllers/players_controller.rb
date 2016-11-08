class PlayersController < ApplicationController
  before_action :store_per_page, only: [:index]
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players
  # GET /players.json
  def index
    scope = Player.order(:created_at)
    scope = scope.fio_like(params[:search]) if params[:search]
    @players = scope.page(params[:page]).per(params[:per])
  end

  # GET /players/1
  # GET /players/1.json
  def show
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: t('controllers.player.create') }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: t('controllers.player.update') }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: t('controllers.player.destroy') }
      format.json { head :no_content }
    end
  end

  def autocomplete
    players = []
    players = Player.order(:fio).fio_like(params[:q]).limit(15) if params[:q].present?
    render json: players.map { |p| {id: p.id, fio: p.fio, avatar: p.avatar.url(:thumb)} }
  end

  private
    def set_player
      @player = Player.find params[:id]
    end

    def player_params
      params.require(:player).permit(:avatar, :fio, :bio, :graduation_year, :crop_x, :crop_y, :crop_w, :crop_h, :crop_r)
    end
end
