class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :nickname, :github_token
  # attr_accessible :title, :body

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider= auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
      user.email = auth.info.email
      user.github_token = auth.credentials.token
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end
  def password_required?
    super && provider.blank?
  end

  # TODO: Move all this into its own class/module

  def gists
    octokit.gists
  end

  def repos
    pages = octokit.user
    octokit.repos
  end

  def location
    octokit.user.location
  end

  def organizations
    octokit.organizations
  end

  def starred
    octokit.starred
  end


  def github_user?
    provider == 'github' && uid.present? && github_token.present?
  end

  private

  def octokit
    Octokit::Client.new(login: username, oauth_token: github_token, auto_traversal: true) if github_user?
  end


end
