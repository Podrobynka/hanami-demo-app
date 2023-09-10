# frozen_string_literal: true

module Notebook
  module Actions
    module Notes
      class Show < Notebook::Action
        include Deps["persistence.rom"]

        params do
          required(:id).value(:integer)
        end

        def handle(request, response)
          halt 422, { errors: request.params.errors }.to_json unless request.params.valid?

          note = rom.relations[:notes].by_pk(
            request.params[:id]
          ).one!

          response.format = :json
          response.body = note.to_json
        end
      end
    end
  end
end
