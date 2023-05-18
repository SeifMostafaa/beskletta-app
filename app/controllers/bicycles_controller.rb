class BicyclesController < ApplicationController
  def index

    query = "true"
    query += " AND name LIKE '#{params[:search_query]}' OR style LIKE '#{params[:search_query]}'" unless params[:search_query].blank?
    query += " AND price >= '#{params[:price_gte]}'" unless params[:price_gte].blank?
    query += " AND price <= '#{params[:price_lte]}'" unless params[:price_lte].blank?

    @bicycles = Bicycle.where(query)
  end

  def show
    @bicycle = Bicycle.where(id: params[:id]).first
  end
end
