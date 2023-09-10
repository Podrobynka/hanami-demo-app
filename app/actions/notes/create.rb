# frozen_string_literal: true

module Notebook
  module Actions
    module Notes
      class Create < Notebook::Action
        include Deps["persistence.rom"]

        params do
          required(:note).hash do
            required(:title).filled(:string)
          end
        end

        def handle(request, response)
          if request.params.valid?
            note = rom.relations[:notes].changeset(:create, request.params[:note]).commit

            response.status = 201
            response.body = note.to_json
          else
            response.status = 422
            response.format = :json
            response.body = request.params.errors.to_json
          end
        end
      end
    end
  end
end
