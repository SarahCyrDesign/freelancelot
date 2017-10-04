class ProjectPolicy < ApplicationPolicy

  # User is a freelancer and created this project for client
  def created_by_freelancer?
    user.freelancer? && record.freelancer_id == user.id
  end

  # Only admin users or freelancers can create jobs
  def create?
    user.admin? || user.freelancer?
  end

 def show?
    user.admin? || created_by_freelancer?
 end

  # Only admin users or freelancers that created current job can update it
  def update?
    user.admin? || created_by_freelancer?
  end

  # Only admin users or freelancers that created current job can delete it
  def destroy?
    user.admin? || created_by_freelancer?
  end

end
