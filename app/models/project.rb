class Project < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

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
    @projects.order(deadline: :asc)
  end

  def self.deadline_warning
    if @project.status != 'Completed' && @project[:deadline - Date.today].to_i < 8
      flash[:alert] =  "#{project.title} is due soon!"
    end
  end

end
