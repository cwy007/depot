# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  image_url   :string
#  price       :decimal(8, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
  default_scope { order(title: :asc) }
  has_many :line_items
  has_many :orders, :through => :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :image_url, :format => {
    :with => %r{\.(gif|jpg|png)$}i,
    :multiline => true,       # $ end of line
    :message => 'must be a URL for GIF, JPG or PNG image.'
  }

  # If a method is private in Ruby, then it cannot be called by an
  # explicit receiver (object). It can only be call implicitly. It can
  # be called implicitly by the class in which it has been described in
  # as well as by the subclasses of this class.
  private

    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, 'Line Items present')
        throw :abort
      end
    end
end
