class CategoryPolicy < ApplicationPolicy

  # Only admin users or freelancers can create categories
  def create?
    user.admin? || user.freelancer?
  end

  def edit
    create?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end

end
