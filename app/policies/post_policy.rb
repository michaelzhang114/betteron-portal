class PostPolicy < ApplicationPolicy
  def update?
    record.user_id == user.id
  end
  def index?
    true
  end

  class Scope
    attr_reader :user, :scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end
    def resolve
      if user.type == 'AdminUser'
        scope.all
      else
        scope.where(user: @user)
      end
    end

  end
end
