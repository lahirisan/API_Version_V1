require 'uri'
require 'net/http'

class ArticlesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    escaped_address = URI.escape('https://www.omdbapi.com/?i=tt3896198&apikey=32197b45') 
    uri = URI.parse(escaped_address)
    @response = Net::HTTP.get_response(uri)

    render json: @response.body
  end
end