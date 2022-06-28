class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
  # validate :title_is_clickbait

  def title_is_clickbait
    clickbait = ['Won\'t Believe', 'Secret', 'Top [number]', 'Guess']
    is_valid = clickbait.any? { |bait| title.include? bait }

    unless is_valid
      errors.add( :title, 'Not provokative enough!' )
    end
  end
end
