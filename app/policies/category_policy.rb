class CategoryPolicy < ApplicationPolicy

  def created_by_user?
    user.freelancer? && record.user_id == user.id
  end

  # Only admin users or freelancers can create categories
  def create?
    user.admin?
  end

  def edit
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

end
