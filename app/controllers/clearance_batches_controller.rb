class ClearanceBatchesController < ApplicationController

  def index
    @clearance_batches  = ClearanceBatch.all
  end

  def create
    clearancing_status = ClearanceBatches::Operations::ClearBatch.call(uploaded_file: params[:csv_batch_file].tempfile)

    clearance_batch    = clearancing_status.clearance_batch
    alert_messages     = []

    # if clearance_batch.persisted?
    #   flash[:notice]  = "#{clearance_batch.items.count} items clearanced in batch #{clearance_batch.id}"
    # else
    #   alert_messages << "No new clearance batch was added"
    # end

    if clearancing_status.errors.any?
      alert_messages << clearancing_status.errors.map{|item_id,msg| "Item ID: #{item_id} - #{msg}"}
    end

    flash[:alert] = alert_messages.join("<br/>") if alert_messages.any?
    redirect_to action: :index
  end

  def show
    @clearance_batch = ClearanceBatch.find(params[:id])

    @total_revenue = @clearance_batch.items.sum(&:price_sold)

    @summary = ClearanceBatches::Operations::ShowReport.call(clearance_batch: @clearance_batch).summary
  end

end
