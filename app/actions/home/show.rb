# frozen_string_literal: true

module Notebook
  module Actions
    module Home
      class Show < Notebook::Action
        def handle(*, response)
          response.body = "Welcome to Notebook"
        end
      end
    end
  end
end
