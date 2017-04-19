class ListPolicy < ApplicationPolicy
  def initialize(user, record)
    #current_user
    @user = user
    #current_list
    @record = record
  end
  #
  # def index?
  #   @resource.users
  # end
  #
  # def show?
  #   @resource.users
  # end
  #
  # def destroy?
  #   @resource.users && @resource.shared_lists.find_by(user: @user).owner?
  # end
  #
  # def update?
  #
  # end
  class Scope < Scope
    def resolve
      @user.lists

    end
  end

  private

  def is_collaborator?
    @resource.shared_lists.find_by(user: @user).collaborator?
  end

  def is_owner?
    @resource.shared_lists.find_by(user: @user).owner?
  end
end
