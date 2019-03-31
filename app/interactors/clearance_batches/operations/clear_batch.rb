# ClearanceBatches::Operations::ClearBatch.call(uploaded_file_name: "")

module ClearanceBatches
  module Operations
    class ClearBatch < BaseInteractor
      include Interactor::Organizer

      expects do
        required(:uploaded_file).value(type?: Tempfile)
      end

      assures do
        required(:clearance_batch).value(type?: ClearanceBatch)
      end

      organize ClearanceBatches::ReadCsv,
               ClearanceBatches::Execute
    end
  end
end