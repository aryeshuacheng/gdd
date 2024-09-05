class ProposalsController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def index
    @proposals = Proposal.all
  end

  def edit
    @proposal = Proposal.find(params[:id])
  end
  def show
    @proposal = Proposal.find(params[:id])
  end

  def update
    Proposal.find(params[:id]).update(title: params[:title])
    redirect_to proposals_path
  end
end
