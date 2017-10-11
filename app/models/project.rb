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

  def self.overdue
    if self.deadline <  Date.today
    highlight("Deadline for " self.title " is soon")
    end
  end

  def not_started
  if self.status == "Received"
    self.title
  else
    "0"
  end
end

  def in_progress
    if self.status == "In Progress"
      self.title
    else
      "0"
    end
  end

  def complete
    if self.status == "Completed"
      self.count
    else
      "0"
    end
  end


  # def self.deadline_warning
  #   if status != 'Completed' && (:deadline.strftime("%d") - Date.today.strftime("%d")) < 8
  #     "This project is due soon!"
  #   end
  # end

end
