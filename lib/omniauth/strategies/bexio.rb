require 'multi_json'
require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Bexio < OmniAuth::Strategies::OAuth2
      option :name, :bexio

      option :client_options, {
        site: 'https://office.bexio.com',
        authorize_url: '/oauth/authorize',
        token_url: '/oauth/access_token'
      }

      uid { access_token.params['user_id'] }

      info do
        {
          email: raw_info['email'],
          first_name: raw_info['first_name'],
          last_name: raw_info['last_name']
        }
      end

      extra do
        {
          company_profile: company_profile
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/api2.php/#{ access_token.params['org'] }/user/#{ access_token.params['user_id'] }", :headers => { 'Accept' => 'application/json' }).parsed
      end

      def company_profile
        access_token.get("/api2.php/#{ access_token.params['org'] }/company_profile/1")
      end
    end
  end
end
