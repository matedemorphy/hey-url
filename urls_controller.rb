# frozen_string_literal: true

class UrlsController < ApplicationController
  before_action :set_url, only: %i[show visit]
  before_action :record_click, only: %i[visit]

  def index
    # recent 10 short urls
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.short_url = SecureRandom.base36(5)
    if @url.save
      redirect_to urls_url, notice: 'Url shorten.'
    else
      render :index
    end
  end

  def show
  end

  def visit
    redirect_to @url.original_url
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end

  def set_url
      @url = Url.find_by!(short_url: params[:short_url])
    rescue ActiveRecord::RecordNotFound
      render file: "#{Rails.root}/public/404", status: :not_found
  end

  def record_click
    @click = Click.new(browser: browser.name, platform: browser.platform.name, url_id: @url.id)
    if @click.save
      @url.increment(:clicks_count)
      @url.save
    end
  end
end