class OpenaiController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  def get_response
    @trained_response = OpenaiService.new(params[:query], params[:type]).call
    # @untrained_response = OpenaiService.new(params[:query], params[:type]).call_untrained
  end
end
