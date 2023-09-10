# frozen_string_literal: true

module Notebook
  module Actions
    module Notes
      class Index < Notebook::Action
        def handle(*, response)
          notes = [
            { title: "Note 1" },
            { title: "Note 2" }
          ]

          response.format = :json
          response.body = notes.to_json
        end
      end
    end
  end
end
