require File.join(Rails.root, '/lib/sunlight_manager.rb')

class WelcomeController < ApplicationController
  def index
    puts "params: #{params}"
    if params[:search] && params[:search][:zip]
      @legislators = SunlightManager.new.get_by_zip(params[:search][:zip])
      @legislators.each { |l| l['skype_link'] = 'skype:+1' + l['phone'].gsub(/[^\d]/, '') + '?call' }
      puts @legislators
    end
  end
end
