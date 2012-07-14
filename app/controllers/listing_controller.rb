class ListingController < ApplicationController
  def index
    @pages = Page.all
  end
end
