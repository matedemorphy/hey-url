# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Click, type: :model do
  subject(:click) { FactoryBot.create(:click) }

  describe 'validations' do
    it 'is not valid if url_id is not present' do
      click.url_id = nil
      expect(click).to_not be_valid
    end

    it 'is not valid if browser is not present' do
      click.browser = nil
      expect(click).to_not be_valid
    end

    it 'is not valid if platform is not present' do
      click.platform = nil
      expect(click).to_not be_valid
    end
  end

  describe 'relationships' do
    let(:url) { FactoryBot.create(:url) }

    it 'url_id should be valid' do
      click.url_id = url.id
      expect(click.url_id).to eq(url.id)
    end
  end
end
