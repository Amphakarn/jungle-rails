class ProductsController < ApplicationController

  def index
    # uses MODEL to fetch/create data from DB
    @products = Product.all.order(created_at: :desc)
    # uses VIEW to figure out what HTML, JSON or else to send back. View files are located in the views folder.
    # render :index # <= implicitely doing behind the scene, so doesn't need to write it out
  end

  def show
    @product = Product.find params[:id]
  end

end
