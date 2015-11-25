class AuthenticationConcern

  include CASino::SessionsHelper
  include CASino::AuthenticationProcessor
  include CASino::TwoFactorAuthenticatorProcessor
  # include CASino::TicketGrantingTicketProcessor

  def initialize(request, cookies=nil)
    @request = request
    @cookies = cookies
  end

  def devise_signed_in?
    @request.env['warden'].authenticate?(scope: :user)
  end

  def casino_signed_in?
    signed_in?
  end

  def cookies
    @cookies ||= ActiveSupport::HashWithIndifferentAccess.new(@request.cookies)
  end

  def request
    @request
  end

  def params
    ActiveSupport::HashWithIndifferentAccess.new(@request.params)
  end

  def sessions_path
    '/'
  end

  def redirect_to(path, options={})
    # placeholder to keep CASino sign in helpers happy
  end


end
