class Category < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :project_categories
  has_many :projects, through: :project_categories
end
