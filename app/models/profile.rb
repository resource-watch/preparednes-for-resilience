class Profile < ApplicationRecord
  has_attached_file :avatar, styles: { medium: '300x>', thumbnail: '100x>' }
  validates_attachment_content_type :avatar, content_type: %r{^image\/.*}
  do_not_validate_attachment_file_type :avatar

  validates_presence_of :user_id
  validates_presence_of :avatar
end