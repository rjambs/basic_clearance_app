# bundle exec rspec spec/interactors/clearance_batches/read_csv_spec.rb

require "rails_helper"

describe ClearanceBatches::ReadCsv do
  describe "success cases" do
    include_context "normal csv"

    let(:context) { described_class.call(uploaded_file_name: csv_filename)  }


    it "must read the csv and come up with the items listed here" do
      expect(context.items).to eq(items)
    end

    it "must be a success" do
      expect(context).to be_a_success
    end
  end

  describe "failure case - csv has rows that dont exist in db" do
    include_context "erroneous csv"

    let(:context) { described_class.call(uploaded_file_name: csv_filename)  }

    it "must fail" do
      expect(context.error).to eq("Some rows are problematic: {99=>\"Item id 99 could not be found\"}")
      expect(context).to be_a_failure
    end
  end


end
