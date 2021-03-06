class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index]

  # GET /categories/:category_id/projects
  # GET /projects?search=something
  # GET /projects
  def index
    if params[:search]
      @projects = Project.search(params[:search]).order("created_at DESC")
    elsif params[:category_id]
      category = Category.find_by(id: params[:category_id])
      @projects = category.projects
    else
      @projects = Project.all.order("created_at DESC")
    end
    respond_to do |f|
      f.json { render json: @projects }
      f.html { render :show }
    end
  end

  def new
    @project = Project.new(freelancer_id: params[:user_id])
    authorize @project
  end

  def show
    authorize @project
    respond_to do |f|
      f.json { render json: @project }
      f.html
    end
  end

  def create
    @project = Project.new(project_params)
    authorize @project

    if @project.save
      redirect_to @project, alert: "Project was successfully created"
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
    redirect_to @project, alert: "Project was successfully updated"
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
    redirect_to root_path, alert: "Project was successfully deleted"
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :description, :client_name, :freelancer_id, :invoice_sent, :status, :budget, :time_log, :start_date, :deadline, :ticket, category_ids:[], categories_attributes:[:name])
    end
end
