class Chapter < ApplicationRecord
  has_rich_text :content
  has_one_attached :image_header

  before_create :set_default_sort_order
  
  validates :title, presence: true
  validates :content, presence: true
  
  # Scope to order chapters by explicit sort order
  scope :order_chapters_with_intro_first, -> {
    order(sort_order: :asc, created_at: :asc)
  }
  
  # Helper method to check if this is the intro chapter
  def intro_chapter?
    title.downcase.include?('intro')
  end
  
  # Get the chapter number (intro doesn't get a number)
  def chapter_number
    return nil if intro_chapter? || custom_label.present?
    
    # Count non-intro, non-custom-label chapters before this one in configured order, plus 1
    Chapter.where("sort_order < ? AND custom_label IS NULL AND LOWER(title) NOT LIKE '%intro%'", sort_order).count + 1
  end

  def chapter_badge
    return custom_label if custom_label.present?
    return "Introduction" if intro_chapter?

    number = custom_number.presence || chapter_number
    "Chapter #{number}"
  end

  private
    def set_default_sort_order
      self.sort_order ||= (Chapter.maximum(:sort_order) || 0) + 1
    end
end
