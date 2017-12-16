class Product < ApplicationRecord
  default_scope { order(title: :asc) }

  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :image_url, :format => {
    :with => %r{\.(gif|jpg|png)$}i,
    :multiline => true,       # $ end of line
    :message => 'must be a URL for GIF, JPG or PNG image.'
  }
end
