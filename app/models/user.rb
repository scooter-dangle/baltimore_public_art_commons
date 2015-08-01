class User < ActiveRecord::Base
  has_secure_password

  enum role: [ :admin, :curator, :cataloguer ]


  def self.create_invited_user(user_params)
    new(user_params.merge password: RandomHash.generate,
                          confirmed: false,
                          confirmation_hash: RandomHash.generate)
  end
end
