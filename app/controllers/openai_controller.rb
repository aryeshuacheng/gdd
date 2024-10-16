class OpenaiController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  def get_response

    Thread.new{@trained_response = OpenaiService.new(params[:query], params[:type]).call}

    redirect_to :controller => 'proposals', :action => 'index'
    # @untrained_response = OpenaiService.new(params[:query], params[:type]).call_untrained
  end
end
