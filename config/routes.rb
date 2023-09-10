# frozen_string_literal: true

module Notebook
  class Routes < Hanami::Routes
    root to: "home.show"
    get "/home/:id", to: "home.show"
    get "/notes", to: "notes.index"
    get "/notes/:id", to: "notes.show"
  end
end
