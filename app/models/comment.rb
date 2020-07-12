class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :mod

  validates :content, presence: true
  # validates :content, exclusion: { in: ["Banned words here"]} # Use this to add any banned phrases, this is gaming we're talking about, so brace yourself.
  
  def commenter
    User.find(self.user_id).username
  end
end
