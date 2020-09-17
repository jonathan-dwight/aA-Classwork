# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates :username, :session_token, :password_digest, presence: true
    validates :username, :session_token, uniqueness: true
    validates :password, length: {minimum: 6, allow_nil: true }
    after_initialize :ensure_session_token
    attr_reader :password
        
    has_many :subs

    has_many :posts,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: 'User'
    #spire
    def self.find_by_credentials(username, pw)
        user = User.find_by(username: username)
        return nil if user.nil?
        user.is_password?(pw) ? user : nil
    end
    
    
    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    
    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end
    
    def is_password?(pw)
        BCrypt::Password.new(self.password_digest).is_password?(pw)
    end
    
    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end
    
    private
    
    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

end