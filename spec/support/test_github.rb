require 'sinatra/base'

class TestGitHub < Sinatra::Base

  get '/user' do
    json_response 200, 'user.json'
  end

  get '/:user/repos' do
    json_response 200, 'repos.json'
  end

  get '/repos/:user/:repository/branches' do
    json_response 200, 'branches.json'
  end

  get '/repos/:user/:repository/pulls' do
    json_response 200, 'pull_requests.json'
  end

  get '/repos/:user/:repository/issues/comments' do
    json_response 200, 'pull_request_comments.json'
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
