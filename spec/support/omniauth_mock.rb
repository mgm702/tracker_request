module OmniAuthMock
  class User
    include Capybara::DSL
    def current_user
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:github] = {
        provider: 'github',
        uid: '1234567',
        credentials: {
          token: '3kynje'
        },
        info: {
          nickname: 'jtest',
          name: 'Joe Test',
          email: 'email@email.com',
          image: 'jtest.jpg'
        }
      }
      visit 'auth/github'
    end
  end
end
