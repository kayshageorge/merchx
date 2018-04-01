class SkusController < ApplicationController
  before_action :authenticate_user!, except: [:search]
  before_action :set_sku, only: [:show, :update, :destroy]

  def index
    all_skus = Sku.where(product_id:params[:product_id])
    @skus = all_skus.order(id: :asc)

    render json: @skus
  end

  def search
    all_skus = Sku.where(product_id:params[:product])
    @sku = all_skus.where(size:params[:selected_size])

    render json: @sku
  end

  def show
    render json: @sku
  end

  def create
    @sku = Sku.new(sku_params)

    if @sku.save
      render json: @sku, status: :created, location: @sku
    else
      render json: @sku.errors, status: :unprocessable_entity
    end
  end

  def update
    if @sku.update(sku_params)
      render json: @sku
    else
      render json: @sku.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @sku.destroy
  end

  private

    def set_sku
      @sku = Sku.find(params[:id])
    end

    def sku_params
      params.require(:sku).permit(:product_id, :size, :price, :qty)
    end
end
