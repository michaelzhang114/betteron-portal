class VideoPolicy < ApplicationPolicy
  def update?
    record.post.member?(user)
  end
  def show?
    record.post.member?(user)
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
