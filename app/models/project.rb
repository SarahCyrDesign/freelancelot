class Project < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  belongs_to :freelancer, :class_name => 'User', :foreign_key => 'freelancer_id'
  belongs_to :category
  accepts_nested_attributes_for :categories
end
