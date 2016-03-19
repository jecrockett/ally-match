class User < ActiveRecord::Base
  validates :u_id, presence: true, uniqueness: true

  default_scope -> { order(high_score: :desc) }

  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(u_id: auth['uid'])

    user.name = auth['info']['name']
    user.email = auth['info']['email']
    user.token = auth['credentials']['token']

    user.save
    user
  end
end
