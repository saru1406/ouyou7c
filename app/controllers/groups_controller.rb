class GroupsController < ApplicationController

  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def new
    @group = Group.new

  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      redirect_to groups_path
    else
      @groups=Group.all
      render 'new'
    end
  end

  def update
    @group = Group.find(params[:id])
    if@group.update(group_params)
    redirect_to group_path(@group.id)
    else
    render 'edit'
    end
  end


  def index
    @groups=Group.all
    @book = Book.new
  end


  def show
    @group=Group.find(params[:id])
  end

  def edit
    @group=Group.find(params[:id])
  end

private

  def group_params
    params.require(:group).permit(:name, :introduction, :image )
  end

end
