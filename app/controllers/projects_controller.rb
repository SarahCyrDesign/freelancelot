class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index]

  def index
    @projects = Project.all
    @categories = Category.all
  end

  def new
    @project = Project.new
    # @project.categories.build
    authorize @project
  end

  def show
    authorize @project
  end

  def create
    # binding.pry
    @project = Project.new(project_params)
    authorize @project

    if @project.save
      redirect_to @project, alert: "Project offer successfully created"
    else
      render new_project_path, alert: "Please fill out incomplete fields"
    end
  end

  def edit
    authorize @project
  end

  def update
    authorize @project
    @project.update(project_params)
    redirect_to @project, alert: "Project offer successfully updated"
  end

  def dashboard
    if current_user.freelancer?
      @projects = current_user.projects
    else
      redirect_to root_path, alert: "You are not authorized to see that page."
    end
  end

  def destroy
    authorize @project
    @project.destroy
    redirect_to root_path, alert: "Project offer successfully deleted"
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :description, :client_name, :freelancer_id, :invoice_sent, :status, :budget, :time_log, :start_date, :deadline, :ticket, category_ids:[], categories_attributes:[:name])
    end
end
