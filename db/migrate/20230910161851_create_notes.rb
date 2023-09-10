# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :notes do
      primary_key :id
      column :title, :text, null: false
    end
  end
end
