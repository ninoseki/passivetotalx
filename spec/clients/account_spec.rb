# frozen_string_literal: true

RSpec.describe PassiveTotal::Client::Account, :vcr do
  let(:api) { PassiveTotal::API.new }

  describe "#monitors" do
    it do
      res = api.account.monitors
      expect(res).to be_a(Hash)
    end
  end
end
