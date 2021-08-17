# frozen_string_literal: true

FactoryBot.define do
  factory :url do
    original_url { 'https://google.com' }
    short_url { SecureRandom.base36(5) }

    factory :url_with_clicks do
      transient do
        clicks { 10 }
      end

      after(:create) do |url, evaluator|
        FactoryBot.create_list(:click, evaluator.clicks, url: url)
      end
    end
  end
end