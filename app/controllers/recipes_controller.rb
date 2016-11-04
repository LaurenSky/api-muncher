require 'will_paginate/array'

class RecipesController < ApplicationController
  def index
    @ingredient = params[:search_term]
    @recipes = Recipe.search(@ingredient).paginate(:page => params[:page], :per_page => 10)

  end

  def show
    @recipe = Recipe.by_uri(params[:uri])
    @Page = params[:page]
    @all_indgredients = @recipe.ingredientLines
    @yield = @recipe.yield.to_i
  end
end
