class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  def index
    @members = Member.paginate(:page => params[:page]).per_page(10)
  end

  def show
    @bets = Bet.accepted.for_member(@member)
  end

  def edit
    if @member.user.nil?
        @member.build_user
    end
  end

  def new
    @member = Member.new
    @member.build_user
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to @member, notice: "#{@member.name} Bet was sent"
    else
      render action: 'new'
    end
  end

  def update
    if @member.update(member_params)
      redirect_to @member, notice: "#{@member.name} was revised"
    else
      render action: 'edit'
    end
  end

  def destroy
    @member.destroy
    redirect_to members_url, notice: "#{@member.name} was deleted"
  end

  private
    def set_member
      @member = Member.find(params[:id])
    end

    def member_params
      params.require(:member).permit(:first_name, :last_name, :date_of_birth, :number_of_bets, :bets_won, :active, user_attributes: [:id, :username, :password, :password_confirmation, :role])
    end
end
