# frozen_string_literal: true

RSpec.describe Notebook::Actions::Notes::Show, type: :database do
  let(:notes) { Hanami.app["persistence.rom"].relations[:notes] }
  let!(:note_id) { notes.insert(title: "Note 1") }
  let(:params) { { id: note_id } }

  it "works" do
    response = subject.call(params)
    expect(response).to be_successful
  end
end
