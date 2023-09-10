# frozen_string_literal: true

module Notebook
  module Persistence
    module Relations
      class Notes < ROM::Relation[:sql]
        schema(:notes, infer: true)

        use :pagination
        per_page 5
      end
    end
  end
end
