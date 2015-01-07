class EntriesController < ApplicationController
  def index
    @feeds = Feed.all
    @parsed_feeds = Array.new
    @entries = Array.new

    @feeds.each do |feed|
      rss = SimpleRSS.parse open(feed.url)
      @parsed_feeds.push(rss)
      @entries.concat rss.entries
    end
  end

  def show
    @feeds = Feed.all
    @feed = Feed.find(params[:id])
    @parsed_feed = SimpleRSS.parse open(@feed.url)
  end
end
