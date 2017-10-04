class ProjectCategory < ActiveRecord::Base
  belongs_to :job
  belongs_to :category 
end
