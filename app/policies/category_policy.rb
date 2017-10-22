class CategoryPolicy < ApplicationPolicy

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
