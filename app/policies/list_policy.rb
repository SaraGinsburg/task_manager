class ListPolicy < ApplicationPolicy
  def initialize(user, record)
    #current_user
    @user = user
    #current_list
    @record = record
  end

  def show?
    is_collaborator? || is_owner?
  end

  def update?
    is_collaborator? || is_owner?
  end

  def update?
    is_owner?
  end

  def destroy?
    is_owner?
  end

  class Scope < Scope
    def resolve
      @user.lists
    end
  end

  private

  def is_collaborator?
    @record.shared_lists.find_by(user: @user).collaborator?
  end

  def is_owner?
    @record.shared_lists.find_by(user: @user).owner?
  end
end
