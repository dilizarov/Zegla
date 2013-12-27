class User < ActiveRecord::Base
  attr_accessible :password, :username
  attr_reader :password

  has_one :location
  
  has_many :requests, :through => :requests_join
  
  has_many :requests_join,
  :class_name => "Friendship",
  :foreign_key => :accepter,
  :conditions => { :status => false }

  validates :username, :presence => true
  validates :username, :uniqueness => true
  validates :password_digest, :presence => { :message => "Password can't be blank" }
  validates :password, :length => { :minimum => 6, :allow_nil => true }
  validates :session_token, :presence => true

  after_initialize :ensure_session_token

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)

    return nil if user.nil?

    user.is_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end

  def self.search_by_name(query)
    results = []
    intermediary = []
    return results if query.empty?
    users = User.all
    query = query.downcase
    
    users.sort {|u1, u2| u1.username <=> u2.username }.each do |user|
      name = user.username
      if name.start_with?(query)
        results << {:id => user.id, :name => name}
      elsif name.include?(query)
        intermediary << {:id => user.id, :name => name}
      end
    end
    
    results += intermediary
  end
      
  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
