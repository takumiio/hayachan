class DamagesController < ApplicationController
  before_action :set_damage, only: [:show, :update, :destroy]

  def attack

    player = nil
    begin
      player = Damage.find(params[:id])
    rescue => e
      render json: { message: "そんなやつはいねぇ!!!" }
      return
    end

    damage_hp = params[:damage_hp].to_i

    now_hp = player.hp - damage_hp

    if now_hp < 1
      render json: { message: "死にました" }
      return
    end

    player.hp = now_hp

    if player.save
      render json: player
    else
      render json: player.error, status: :unprocessable_entity
    end

  end

  # GET /damages
  def index
    @damages = Damage.all

    render json: @damages
  end

  # GET /damages/1
  def show
    render json: @damage
  end

  # POST /damages
  def create
    @damage = Damage.new(damage_params)

    if @damage.save
      render json: @damage, status: :created, location: @damage
    else
      render json: @damage.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /damages/1
  def update
    if @damage.update(damage_params)
      render json: @damage
    else
      render json: @damage.errors, status: :unprocessable_entity
    end
  end

  # DELETE /damages/1
  def destroy
    @damage.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_damage
      @damage = Damage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def damage_params
      params.require(:damage).permit(:hp, :mp)
    end
end
