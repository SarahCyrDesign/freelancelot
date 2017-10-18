class Project < ActiveRecord::Base
  require 'action_view'
  include ActionView::Helpers::TextHelper

  validates_presence_of :title, :description, :client_name, :budget, :start_date, :deadline, :ticket
  validates_uniqueness_of :title, message: "This Project Title already exists"
  validates_presence_of :description, length: { maximum: 50 }, message: "description cannot be more than 50 characters"
  validates_uniqueness_of :ticket, message: "This Project Ticket Number already exists"

  belongs_to :freelancer, :class_name => 'User', :foreign_key => 'freelancer_id'
  has_many :project_categories
  has_many :categories, through: :project_categories

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.project_categories.build(category: category)
    end
  end

  def self.list_by_deadline
    order(deadline: :asc)
  end


  def self.deadline_message
    self.all.select do |project|
      project.status != 'Completed' && project.deadline.strftime("%d").to_i - Date.today.strftime("%d").to_i < 8
    end
  end



  def self.not_started
    self.all.select do |project|
      project.status == "Received"
    end
  end

  def self.in_progress
    self.all.select do |project|
      project.status == "In Progress"
    end
  end

  def self.complete
    self.all.select do |project|
      project.status == "Completed"
    end
  end

  def self.search(search)
    where('ticket LIKE ? OR title LIKE ?', "%#{search}%", "%#{search}%")
  end

end
