# frozen_string_literal: true

RSpec.describe "GET /notes/:id", type: [:request, :database] do
  let(:notes) { app["persistence.rom"].relations[:notes] }

  context "when a note matches the given id" do
    let!(:note_id) do
      notes.insert(title: "Note 1")
    end

    it "renders the note" do
      get "/notes/#{note_id}"

      expect(last_response).to be_successful
      expect(last_response.content_type).to eq("application/json; charset=utf-8")

      response_body = JSON.parse(last_response.body)

      expect(response_body).to eq(
        "id" => note_id, "title" => "Note 1"
      )
    end
  end

  context "when no note matches the given id" do
    it "returns not found" do
      get "/notes/#{notes.max(:id).to_i + 1}"

      expect(last_response).to be_not_found
      expect(last_response.content_type).to eq("application/json; charset=utf-8")

      response_body = JSON.parse(last_response.body)

      expect(response_body).to eq(
        "error" => "not_found"
      )
    end
  end
end
