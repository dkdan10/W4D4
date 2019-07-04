# == Schema Information
#
# Table name: tracks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  ord        :integer          not null
#  lyrics     :text
#  album_id   :integer          not null
#  bonus      :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  validates :title, :ord, :album_id, :bonus, presence: true

  belongs_to :album

end
