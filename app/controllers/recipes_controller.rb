class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all.order('created_at DESC')
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipes_params)
    if @recipe.save!
      redirect_to @recipe, notice: 'Successfully created new recipe'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @recipe.update_attributes(recipes_params)
      redirect_to @recipe, notice: 'Successfully updated'
    else
      render 'edit', notice: 'Unable to edit recipe!'
    end
  end

  def destroy
    @recipe.destroy!
    redirect_to :back, notice: 'Successfully deleted recipe'
  end

  private

  def recipes_params
    params.require(:recipe).permit(:title, :description, :image)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
