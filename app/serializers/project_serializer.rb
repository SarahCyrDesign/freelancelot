class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :client_name, :freelancer_id, :invoice_sent, :status, :budget, :time_log, :start_date, :deadline, :ticket


  has_many :project_categories
  has_many :categories, through: :project_categories
end
