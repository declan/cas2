class CASInterceptorController < CASino::SessionsController

  def new
    tgt = current_ticket_granting_ticket
    unless params[:renew] || tgt.nil?
      handle_signed_in(tgt)
    else
      redirect_to new_user_session_path(service_params)
    end
    redirect_to(params[:service]) if params[:gateway] && params[:service].present?
  end

  def service_params
    params.permit(:service)
  end

end
