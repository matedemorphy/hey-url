# frozen_string_literal: true

class Url < ApplicationRecord
  scope :latest, -> { limit(10).order('created_at desc') }

  has_many :clicks
  
  URL_REGEXP = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.  [a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
  validates :original_url, presence: true,
                           format: { multiline: true,
                                     with: URL_REGEXP,
                                     message: 'invalid URL' }
  validates :short_url, presence: true
end
