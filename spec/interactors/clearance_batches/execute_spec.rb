# bundle exec rspec spec/interactors/clearance_batches/execute_spec.rb

require "rails_helper"

describe ClearanceBatches::Execute do
  include_context "setup items with styles"

  let(:context) { described_class.call(items: items) }

  describe "success" do
    it "should have a clearance batch" do
      expect(context.clearance_batch.class).to eq(ClearanceBatch)
    end

    it "should have a 3 items that are status = clearanced" do
      expect(context.items.pluck(:status)).to eq(['clearanced', 'clearanced', 'clearanced'])
    end
  end
end