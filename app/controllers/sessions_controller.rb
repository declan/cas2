class SessionsController < Devise::SessionsController

  def create
    super
    @auth = AuthenticationConcern.new(request, cookies)
    @auth.sign_in(authentication_result_from(resource))
  end

  # This formats a Devise resource as the gross hash that CASino wants
  def authentication_result_from(resource)
    {
      authenticator: 'cas_demo',
      user_data: {
        username: resource.email,
        extra_attributes: nil
      }
    }
  end

  def destroy
    super
    @auth = AuthenticationConcern.new(request, cookies)
    @auth.sign_out
  end

end
