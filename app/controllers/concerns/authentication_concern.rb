class AuthenticationConcern

  def initialize(request)
    @request = request
  end

  include CASino::SessionsHelper
  # include CASino::TicketGrantingTicketProcessor

  def devise_signed_in?
    @request.env['warden'].authenticate?(scope: :user)
  end

  def casino_signed_in?
    signed_in?
  end

  def cookies
    ActiveSupport::HashWithIndifferentAccess.new(@request.cookies)
  end

  def request
    @request
  end

end
