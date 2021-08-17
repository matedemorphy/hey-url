# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Url, type: :model do
  subject(:url) { FactoryBot.create(:url) }
  subject(:url_with_clicks) { FactoryBot.create(:url_with_clicks, clicks: 10) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(url).to be_valid
    end

    it 'is not valid if :original_url is not present' do
      url.original_url = nil
      expect(url).to_not be_valid
    end

    it 'is not valid if :short_url is not present' do
      url.short_url = nil
      expect(url).to_not be_valid
    end
  end

  describe 'relationships' do
    it 'should have many clicks' do
      expect(url_with_clicks.clicks.length).to eq(10)
    end
  end

  describe 'scopes' do
    10.times { Url.create(short_url: SecureRandom.base36(5), original_url: "https://google.com")}
    let(:urls) { Url.all.map(&:id).reverse.take(10) }
    let(:latest_url) { Url.latest.map(&:id) }
    it 'should return lastest 10 urls' do
      expect(latest_url).to eq(urls)
    end
  end
end
