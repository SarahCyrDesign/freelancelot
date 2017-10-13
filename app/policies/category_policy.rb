class CategoryPolicy < ApplicationPolicy
 #need to fix this to only allow freelancers to edit own categoru
  def created_by_freelancer?
    user.freelancer == user.id
  end

  # Only admin users or freelancers can create categories
  def create?
    user.admin? || user.freelancer?
  end

  def edit
    user.admin? || created_by_freelancer?
  end

  def update?
    user.admin? || created_by_freelancer?
  end

  def destroy?
    user.admin? || created_by_freelancer?
  end

end
