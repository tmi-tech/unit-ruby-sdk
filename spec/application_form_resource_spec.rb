# frozen_string_literal: true

require "date"
require_relative "./spec_helper"

RSpec.describe Unit::ApplicationForm do
  before do
    configure_tests
  end

  it "Should create application form" do
    response = described_class.create_application_form()
    expect(response.data["type"]).to eq "businessApplication"
  end
end
