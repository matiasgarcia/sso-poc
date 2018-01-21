module OmniAuth
  module Strategies
    class ProviderPoc < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      #TODO: IF I CHANGE THIS, THE ROUTE WONT MATCH, CHECK WHY THIS IS HAPPENING:
      option :name, 'provider_poc'

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
          site: 'http://localhost:3000',
          authorize_url: 'http://localhost:3000/oauth/authorize',
          access_token_url: 'http://localhost:3000/oauth/token',
      }


      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid{ raw_info['id'] }

      info do
        {
            :name => raw_info['name'],
            :email => raw_info['email']
        }
      end

      extra do
        {
            raw_info: raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/me').parsed
      end
    end
  end
end
