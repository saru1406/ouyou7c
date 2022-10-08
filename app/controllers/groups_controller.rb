class GroupsController < ApplicationController

  before_action :authenticate_user!


  def new
    @group = Group.new

  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    @group.users << current_user
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
    redirect_to groups_path
    else
    render 'edit'
    end
  end

  def destroy
    @group = Group.find(params[:id])
#current_userは、@group.usersから消されるという記述。
    @group.users.delete(current_user)
    redirect_to groups_path
  end

  def join
    @group = Group.find(params[:group_id])
    @group.users << current_user
    redirect_to  groups_path
  end


  def index
    @groups=Group.all
    @book = Book.new
  end


  def show
    @group=Group.find(params[:id])
    @book = Book.new
  end

  def edit
    @group=Group.find(params[:id])
  end

private

  def group_params
    params.require(:group).permit(:name, :introduction, :image )
  end

end
