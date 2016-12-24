class PowdersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_powder, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @powders = Powder.all
    respond_with(@powders)
  end

  def show
    respond_with(@powder)
  end

  def new
    @powder = Powder.new
    respond_with(@powder)
  end

  def edit
  end

  def create
    @powder = Powder.new(powder_params)
    @powder.save
    respond_with(@powder)
  end

  def update
    @powder.update(powder_params)
    respond_with(@powder)
  end

  def destroy
    @powder.destroy
    respond_with(@powder)
  end

  private
    def set_powder
      @powder = Powder.find(params[:id])
    end

    def powder_params
      params.require(:powder).permit(:manufacturer_id, :color_id, :part_number, :name)
    end
end
