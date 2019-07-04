# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  band_id    :integer          not null
#  year       :integer          not null
#  live       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  validates :band_id, :title, :year, presence: true

  belongs_to :band
  has_many :tracks
end
