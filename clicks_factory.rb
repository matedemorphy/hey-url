# frozen_string_literal: true

FactoryBot.define do
  factory :click do
    browser { 'A Browser' }
    platform { 'A Platform' }
    url
  end
end