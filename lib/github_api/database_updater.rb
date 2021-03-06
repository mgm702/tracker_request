class GithubApi::Database_Updater

  def update_database_to_match_api(args={})
    case args[:model_call]
      when "repository"
        if args[:current_user] != nil
          repo_matcher(args[:current_user], args[:api_ids])
        end
      when "branch"
        if args[:repo_ids] != nil
          branch_matcher(args[:api_ids], args[:repo_ids])
        end
      when "pull_request"
        if args[:repo_ids] != nil
          pull_request_matcher(args[:api_ids], args[:repo_ids])
        end
      when "pull_request_comment"
        if args[:repo_ids] != nil
          pull_request_comment_matcher(args[:api_ids], args[:repo_ids])
        end
      else
        "Error finding database model!"
    end
  end

  private
  def repo_matcher(current_user, api_ids)
    repositories = Repository.where(user_id: current_user.id).all
    repo_ids = []
    repositories.each {|x| repo_ids << x.repo_github_ident}
    Repository.where(repo_github_ident: repo_ids - api_ids).destroy_all
  end

  def branch_matcher(api_ids, repo_ids)
    branches = Branch.where(repository_id: repo_ids).select([:latest_commit_sha, :branch_name])
    branch_commit_sha, branch_names, branch_commit_shas = Array.new(3) {[]}
    branches.each {|x| branch_commit_sha << "#{x.branch_name} #{x.latest_commit_sha}"}
    branch_delete_array = branch_commit_sha - api_ids
    branch_delete_array.each {|x| branch_names << x.split(/\s/).first}
    branch_delete_array.each {|x| branch_commit_shas << x.split(/\s/).last}
    Branch.where.not(repository_id: repo_ids).destroy_all
    Branch.where(branch_name: branch_names,latest_commit_sha: branch_commit_shas).destroy_all
  end

  def pull_request_matcher(api_ids, repo_ids)
    pull_requests = PullRequest.where(repository_id: repo_ids).select([:pr_github_ident])
    pr_github_array = []
    pull_requests.each {|x| pr_github_array << x.pr_github_ident}
    PullRequest.where.not(repository_id: repo_ids).destroy_all
    PullRequest.where(pr_github_ident: pr_github_array - api_ids).destroy_all
  end

  def pull_request_comment_matcher(api_ids, repo_ids)
    pull_request_comments = PullRequestComment.where(repository_id: repo_ids).select([:pr_comment_github_ident])
    pr_comment_github_array = []
    pull_request_comments.each {|x| pr_comment_github_array << x.pr_comment_github_ident }
    PullRequestComment.where.not(repository_id: repo_ids).destroy_all
    PullRequestComment.where(pr_comment_github_ident: pr_comment_github_array - api_ids).destroy_all
  end
end
