# frozen_string_literal: true

class StaticPagesController < ApplicationController
  protect_from_forgery

  def home
    if current_user
      @new_quote_requests = QuoteRequest.where('status=?', 'New')
      @outstanding_work_orders = WorkOrder.includes(:customer, :services)
                                          .left_outer_joins(:production_stage, :services)
                                          .where('date_completed IS NULL')

      @work_orders = @outstanding_work_orders
    end
  end

  def about; end

  def thank_you; end
end
