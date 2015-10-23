require File.join(Rails.root, '/lib/sunlight_manager.rb')

class WelcomeController < ApplicationController
  def index
    puts "params: #{params}"
    if params[:search] && params[:search][:zip]
      @legislators = SunlightManager.new.get_by_zip(params[:search][:zip])
      if @legislators.empty?
        flash.alert = "No representatives found."
        redirect_to welcome_index_path
      else
        @legislators.each do |l|
          l['skype_link'] = 'skype:+1' + l['phone'].gsub(/[^\d]/, '') + '?call'
          if l['last_name'] == 'Gillibrand'
            l['twitter_id'] = 'SenGillibrand'
          end
        end
      end
    end
  end
end
