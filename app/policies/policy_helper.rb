module PolicyHelper
  extend ActiveSupport::Concern

  def index?
    user_allowed?(user)
  end


  def show?
    user_allowed?(user)
  end


  def create?
    user_allowed?(user)
  end


  def update?
    user_allowed?(user)
  end


  def destroy?
    user_allowed?(user)
  end


  def bulk_destroy?
    destroy?
  end


  def bulk_restore?
    update?
  end


  private


    def user_allowed?(user)
      user.admin?
    end

end
