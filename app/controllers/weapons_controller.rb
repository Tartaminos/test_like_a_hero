class WeaponsController < ApplicationController
  def index
    @weapons = Weapon.all
  end

  def create
    @weapon = Weapon.create(weapon_params)
    redirect_to weapons_path
  end

  def show
    @weapon = Weapon.find(params[:id])
  end

  def delete
    @weapon = Weapon.find(params[:id])
    begin
      @weapon.destroy
    rescue => erro
      logger.debug "#{@weapon.nome}: #{erro}"
    end
  end

  private

  def weapon_params
    params.require(:weapon).permit(:name, :description, :powerbase, :powerstep, :level, :currentpower, :title)
  end
end
