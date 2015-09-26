class EventPolicy < ApplicationPolicy
  attr_reader :user, :event

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user_id: @user.id)
      end
    end

    def initialize(user, event)
      @user = user
      @event = event
    end

    def update?
      user.admin? or not record.published?
    end
  end
end
