# frozen_string_literal: true

RSpec.describe "GET /notes pagination", type: [:request, :database] do
  let(:notes) { app["persistence.rom"].relations[:notes] }

  before do
    10.times do |n|
      notes.insert(title: "Note #{n}")
    end
  end

  context "given valid page and per_page params" do
    it "returns the correct page of notes" do
      get "/notes?page=1&per_page=3"

      expect(last_response).to be_successful

      response_body = JSON.parse(last_response.body)

      expect(response_body).to eq([
        { "title" => "Note 0" },
        { "title" => "Note 1" },
        { "title" => "Note 2" }
      ])
    end
  end

  context "given invalid page and per_page params" do
    it "returns a 422 unprocessable response" do
      get "/notes?page=-1&per_page=3000"

      expect(last_response).to be_unprocessable

      response_body = JSON.parse(last_response.body)

      expect(response_body).to eq(
        "errors" => {
          "page" => ["must be greater than 0"],
          "per_page" => ["must be less than or equal to 100"]
        }
      )
    end
  end
end
