class Api::V1::UrlsController < Api::V1::BaseController
  def index
    render json: last_urls,
           status: :ok
  end

  private

  def last_urls
    Url.latest
  end
end