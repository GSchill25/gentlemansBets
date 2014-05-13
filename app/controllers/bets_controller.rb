class BetsController < ApplicationController
  before_action :set_bet, only: [:show, :edit, :update, :destroy]

  def index
    @bets = Bet.paginate(:page => params[:page]).per_page(10)
  end

  def show
  end

  def edit
  end

  def new
    @bet = Bet.new
  end

  def create
    @bet = Bet.new(bet_params)
    if @bet.save
      redirect_to @bet, notice: "#{@bet.name} Bet was sent"
    else
      render action: 'new'
    end
  end

  def update
    if @bet.update(bet_params)
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
      params.require(:bet).permit(:name, :description, :winner, :member_id, :memeber_one_confidence, :memeber_two_confidence, :challengee, :challengee_id, :accepted, :active)
    end

end
