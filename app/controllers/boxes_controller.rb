# frozen_string_literal: true

class BoxesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_box, only: %i[show edit update destroy]

  respond_to :html

  def index
    @boxes = Box.all
    respond_with(@boxes)
  end

  def show
    respond_with(@box)
  end

  def new
    @box = Box.new
    respond_with(@box)
  end

  def edit; end

  def create
    @box = Box.new(box_params)
    @box.save
    respond_with(@box.powder)
  end

  def update
    @box.update(box_params)
    respond_with(@box.powder)
  end

  def destroy
    @box.destroy
    respond_with(@box)
  end

  private

  def set_box
    @box = Box.find(params[:id])
  end

  def box_params
    params.require(:box).permit(:powder_id, :weight, :original_weight)
  end
end
