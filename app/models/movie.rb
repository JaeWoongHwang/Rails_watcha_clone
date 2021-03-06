class Movie < ActiveRecord::Base
  has_many :reviews
  mount_uploader :poster, PhotoUploader

  def number
    # self는 객체 자신을 칭함
    self.reviews.count
  end

  def average
    sum = 0
    self.reviews.each do |review|
      sum += review.rating
    end
    if self.reviews.count == 0
      0
    else
      sum.to_f / self.reviews.count
    end
  end
end
