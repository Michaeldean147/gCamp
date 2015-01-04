class Membership < ActiveRecord::Base
  belongs_to :projects
  belongs_to :user
  # validates :user_id, uniqueness: true
  validate :exists
  validates :user_id, presence: true

  def exists
    if Membership.where(project_id:project_id,user_id:user_id).length > 0 && !self.id
      errors.add(:user_id, "can't be a member again")
    end
  end
end
