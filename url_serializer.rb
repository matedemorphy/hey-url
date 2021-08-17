class UrlSerializer
  include JSONAPI::Serializer

  set_type :url
  attributes :created_at, :original_url, :short_url, :clicks_count
  has_many :clicks
end