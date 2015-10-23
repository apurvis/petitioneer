class PetitionsController < ApplicationController
  def index
    @petitions = Petition.all
  end

  def show
    @petition = Petition.where(id: params[:id]).first

    if params[:search] && params[:search][:zip]
      @zip = params[:search][:zip]
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