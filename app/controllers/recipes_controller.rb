require 'will_paginate/array'

class RecipesController < ApplicationController
  def index
    @ingredient = params[:search_term]
    @recipes = Recipe.search(@ingredient).paginate(:page => params[:page], :per_page => 12) #changed 10 to 12 per page because of look and feel of website
    if @recipes == []
      flash[:empty_array] = "Sorry, there are no recipes that match your request."
    end
  end

  def show
    @recipe = Recipe.by_uri(params[:uri])
    @page = params[:page]
    @all_indgredients = @recipe.ingredientLines
    @yield = @recipe.yield.to_i
  end
end
