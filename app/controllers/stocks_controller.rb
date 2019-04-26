class StocksController < ApplicationController
  def search
    if params[:stock].blank?
      flash.now[:danger] = 'Search can not be empty'
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = 'You have entered an invalid entry' unless @stock
    end
    respond_to do |format|
      format.js { render partial: 'users/search_result' }
    end
  end
end
