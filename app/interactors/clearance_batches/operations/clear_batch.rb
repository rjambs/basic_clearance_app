module ClearanceBatches
  class ClearBatch < BaseInteractor
    include Interactor::Organizer

    expects do
      required(:uploaded_file_name).value(type?: String)
    end

    assures do
      required(:clearance_batch).value(type?: String)
    end

    organize ClearanceBatches::ReadCsv,
             ClearanceBatches::Execute
  end
end