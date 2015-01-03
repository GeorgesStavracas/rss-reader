require 'simple-rss'
require 'open-uri'

class FeedsController < ApplicationController
  def index
    @feeds = Feed.all
  end

  def show
    @feed = Feed.find(params[:id])
  end

  def new
  end

  def create
    #params[:feed].each { |name| render name }
    @feed = SimpleRSS.parse open(params[:feed][:url])
    @db_feed = Feed.new(title: @feed.channel.title, url: params[:feed][:url])

    @db_feed.save
    redirect_to @db_feed
  end
end