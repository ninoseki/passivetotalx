# frozen_string_literal: true

RSpec.describe PassiveTotal::Client::SSL, :vcr do
  let(:api) { PassiveTotal::API.new }

  let(:query) { "240461b20dbb24a61b0a986821c2ad01bd3a8522" }

  describe "#history" do
    it do
      res = api.ssl.history(query)
      expect(res).to be_a(Hash)
    end
  end

  describe "#get" do
    it do
      res = api.ssl.get(query)
      expect(res).to be_a(Hash)
    end
  end

  describe "#keyword" do
    let(:query) { "sinkhole" }

    it do
      res = api.ssl.keyword(query)
      expect(res).to be_a(Hash)
    end
  end

  describe "#search" do
    it do
      res = api.ssl.search(query: "Symantec Class 3 EV SSL CA - G3", field: "issuerCommonName")
      expect(res).to be_a(Hash)
    end
  end
end
