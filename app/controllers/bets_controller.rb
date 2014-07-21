class BetsController < ApplicationController
  before_action :set_bet, only: [:show, :edit, :update, :destroy, :accept]

  def index
    @bets = Bet.paginate(:page => params[:page]).per_page(10)
    @calendar_bets = Bet.all
    @bets_by_date = @calendar_bets.group_by { |b| b.created_at.to_date }
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def show
    @involved_members = []
    @involved_members << [@bet.member.proper_name, @bet.member.bets_won]
    @challenger = Member.find(@bet.challengee_id)
    @involved_members << [@challenger.proper_name, @challenger.bets_won]
  end

  def edit
  end

  def new
    @bet = Bet.new
  end

  def pending
    @bets_to_accept = Bet.to_accept(current_user.member_id)
    @pending_bets = Bet.pending(current_user.member_id)
  end
  
  def accept
    @bet.update_accept
    redirect_to bet_path(@bet)
  end

  def create
    @bet = Bet.new(bet_params)
    @bet.member = current_user.member
    if @bet.save
      @bet.member.number_of_bets = @bet.member.number_of_bets+1
      redirect_to bets_url, notice: "#{@bet.name} Bet was sent"
    else
      render action: 'new'
    end
  end

  def update
    @bet.member = current_user.member
    if @bet.update(bet_params)
      @bet.member.count_wins
      Member.find(@bet.challengee_id).count_wins
      redirect_to @bet, notice: "#{@bet.name} was revised"
    else
      render action: 'edit'
    end
  end

  def destroy
    @bet.destroy
    redirect_to bets_url, notice: "#{@bet.name} was deleted"
  end

  private
    def set_bet
      @bet = Bet.find(params[:id])
    end

    def bet_params
      params.require(:bet).permit(:name, :description, :winner, :member_id, :member_one_confidence, :member_two_confidence, :challengee, :challengee_id, :accepted, :active)
    end

end
