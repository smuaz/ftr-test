class StatesController < ApplicationController
  def show
    @state = State.find_by slug: params[:id]
  end
end