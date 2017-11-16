class ProjectSerializer < ActiveModel::Serializer
  attributes :title, :description, :client_name, :freelancer_id, :invoice_sent, :status, :budget, :time_log, :start_date, :deadline, :ticket, category_ids:[], categories_attributes:[:name]


  has_many :project_categories
  has_many :categories, through: :project_categories
end
