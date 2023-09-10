RSpec.describe "GET /notes", type: :request do
  it "returns a list of notes" do
    get "/notes"

    expect(last_response).to be_successful
    expect(last_response.content_type).to eq("application/json; charset=utf-8")

    response_body = JSON.parse(last_response.body)

    expect(response_body).to eq([
      { "title" => "Note 1" },
      { "title" => "Note 2" }
    ])
  end
end
