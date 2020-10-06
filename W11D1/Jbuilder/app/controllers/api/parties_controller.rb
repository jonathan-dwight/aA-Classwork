class Api::PartiesController < ApplicationController
  def index
    @parties = Party.all
    # @parties.includes(guests: [:gifts])
    render :index
  end

  def show
    @party = Party.includes(guests: [:gifts]).find_by(id: params[:id])
    render :show
  end
end
