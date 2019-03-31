# bundle exec rspec spec/interactors/clearance_batches/operations/clear_batch_spec.rb

require "rails_helper"

describe ClearanceBatches::Operations::ClearBatch do
  describe "success cases" do
    include_context "normal csv"

    let(:context) { described_class.call(uploaded_file: csv_filename)  }

    it "must read the csv and come up with the items listed here" do
      expect(context.items.map{|i| [i.size, i.color]}).to eq(items.map{|i| [i.size, i.color]})
    end

    it "must be a success" do
      expect(context).to be_a_success
    end

    it "should have a clearance batch" do
      expect(context.clearance_batch.class).to eq(ClearanceBatch)
    end
  end
end