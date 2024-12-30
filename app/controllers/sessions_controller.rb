class SessionsController < ApplicationController
  before_action :set_campaign

  def show
    @session = @campaign.sessions.find(params[:id])
  end

  def new
    @session = @campaign.sessions.new
  end

  def create
    @session = @campaign.sessions.new(session_params)
    if @session.save
      redirect_to campaign_path(@session.campaign)
    else
      render :new
    end
  end

  def edit
    @session = @campaign.sessions.find(params[:id])
  end

  def update
    @session = @campaign.sessions.find(params[:id])
    if @session.update(session_params)
      redirect_to campaign_path(@session.campaign)
    else
      render :edit
    end
  end

  def destroy
    @session = @campaign.sessions.find(params[:id])
    @session.destroy
    redirect_to campaign_path(@session.campaign)
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def session_params
    params.require(:session).permit(:date, :summary)
  end
end
