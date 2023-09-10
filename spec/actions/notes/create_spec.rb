# frozen_string_literal: true

RSpec.describe Notebook::Actions::Notes::Create do
  let(:params) { { note: { title: "Note 1" } } }

  it "works" do
    response = subject.call(params)
    expect(response).to be_successful
  end
end
