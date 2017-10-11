class Project < ActiveRecord::Base
  require 'action_view'
  include ActionView::Helpers::TextHelper

  validates_presence_of :title
  validates_uniqueness_of :title

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

  def self.deadline_warning
    if self.status != 'Completed' && (self.deadline.to_i.strftime("%d") - Date.today.strftime("%d")) < 8
      "This project is due soon!"
    end
  end

  def self.not_started
    self.all.select do |project|
      project.status == "Received"
    end.count  end

  def self.in_progress
    self.all.select do |project|
      project.status == "In Progress"
    end.count
  end

  def self.complete
    self.all.select do |project|
      project.status == "Completed"
    end.count
  end

#search function
  def self.search(search)
    where("title LIKE ?", "%#{search}%")
    where("ticket LIKE ?", "%#{search}%")
  end



end
