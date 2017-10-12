class SearchController < ApplicationController
  def index
    if params[:search]
      @projects = Project.search(params[:search]).order("created_at DESC")
    end
  end

end
