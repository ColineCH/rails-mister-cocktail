class DosesController < ApplicationController
  before_action :set_cocktail, only: [:create]
  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    # @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.delete
    redirect_to cocktail_path(@cocktail)

  end

  private
  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
    # unless @ingredient = Ingredient.find_by_name(params[:dose][:ingredient])
    #   @ingredient = Ingredient.create!(name: params[:dose][:ingredient])
    # end
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
