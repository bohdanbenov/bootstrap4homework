require 'faker'
require 'net/http'
require 'uri'

class UsersController < ApplicationController
  def index
    @users = User.all


    @urls = []

    20.times do |x|
      faker = Faker::LoremFlickr.image
      first_part = faker.slice"http://loremflickr.com"
      second_part = get_response_with_redirect(URI.parse(faker))
      url = first_part + second_part
      @urls << url
    end
  end

  def get_response_with_redirect(uri)
    r = Net::HTTP.get_response(uri)
    if r.code == "301"
      r = Net::HTTP.get_response(URI.parse(r.header['location']))
      part_url = r.header['location']
    end
    part_url
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_credentials)

    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])

    @urls = []

    20.times do |x|
      faker = Faker::LoremFlickr.image
      first_part = faker.slice"http://loremflickr.com"
      second_part = get_response_with_redirect(URI.parse(faker))
      url = first_part + second_part
      @urls << url
    end
  end

  private
    def user_credentials
      params.require(:user).permit(:name, :lastname, :email)
    end
end
