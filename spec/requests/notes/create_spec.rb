# frozen_string_literal: true

RSpec.describe "POST /notes", type: [:request, :database] do
  let(:request_headers) do
    {"HTTP_ACCEPT" => "application/json", "CONTENT_TYPE" => "application/json"}
  end

  context "given valid params" do
    let(:params) do
      {note: {title: "Note 1"}}
    end

    it "creates a note" do
      post "/notes", params.to_json, request_headers

      expect(last_response).to be_created
    end
  end

  context "given invalid params" do
    let(:params) do
      {note: {title: nil}}
    end

    it "returns 422 unprocessable" do
      post "/notes", params.to_json, request_headers

      expect(last_response).to be_unprocessable
    end
  end
end
