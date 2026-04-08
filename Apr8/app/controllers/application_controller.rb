class ApplicationController < ActionController::API
  rescue_from SError, with: :error_400

  def error_400(e)
    render json: { status: 400, message: e.message }, status: 400
  end
end
