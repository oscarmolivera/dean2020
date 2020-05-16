class Post < ApplicationRecord
  belongs_to :user

  # Rails6 ActiveStorage
  has_one_attached :thumbnail
  has_one_attached :banner

  # Rails6 ActionText
  has_rich_text :body

  validates :title, length: { minimum: 5 }
  validates :body, length: { minimum: 25 }
  # For paginate HomePage
  self.per_page = 5

  #Friendly SLUG
  extend FriendlyId
  friendly_id :title, use: :slugged

  def optimized_image(image, height, width)
    image.variant(resize_to_fill: [height, width]).processed
  end
end
