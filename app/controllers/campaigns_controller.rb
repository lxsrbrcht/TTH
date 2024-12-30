class CampaignsController < ApplicationController
  before_action :authenticate_user!, only: [:my_campaigns, :new, :create, :update, :destroy]

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.user = current_user
    if @campaign.save
      redirect_to campaign_path(@campaign)
    else
      render :new
    end
  end

  def my_campaigns
    @user = current_user
    @new_campaign = Campaign.new
    @campaigns = current_user.campaigns
  end

  def update
    @campaign = Campaign.find(params[:id])
    @campaign.update(campaign_params)
    redirect_to campaign_path(@campaign)
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    redirect_to my_campaigns_path
  end

  private

  def campaign_params
    params.require(:campaign).permit(:title, :synopsis, :progress, :format, :setting, :players)
  end
end
