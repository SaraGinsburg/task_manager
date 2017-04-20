class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  after_action :verify_authorized, except: [:index, :create]
  after_action :verify_policy_scoped, only: :index

  def create
    @list = List.new(list_params)
    if @list.save
      @list.shared_lists.build(user: current_user, permission: :owner).save
      redirect_to lists_path
    else
      @lists = List.all
      @new_list = @list || List.new
      render :index
    end
  end

  def index
    @lists = policy_scope(List)
    @new_list = List.new
    @new_list.shared_lists.build(user: current_user, permission: :collaborator)
  end

  def show
    # @list.tasks.sort {|a, b| a.due_date <=> b.due_date}
    @task = Task.new
  end

  def update
    @list.update(list_params)
    redirect_to lists_path
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private
  def set_list
    @list = List.find(params[:id])
    authorize @list
  end

  def list_params
    params.require(:list).permit(:name, user_ids:[])
  end
end
