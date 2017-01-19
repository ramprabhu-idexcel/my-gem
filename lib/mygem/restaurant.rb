module Mygem
  class Restaurant < ActiveRecord::Base
    has_many :reviews, dependent: :destroy

    class << self
      def best
        Restaurant
            .joins(:reviews)
            .select("restaurants.*, AVG(reviews.rating) as avg_rating")
            .group("restaurants.id")
            .having("AVG(reviews.rating) > 2")
            .limit(10)
      end

      def great_reviews
        Restaurant
            .joins(:reviews)
            .select("restaurants.*, COUNT(reviews.id) as reviews_count")
            .group("restaurants.id")
            .where("reviews.created_at > ?", 3.months.ago)
            .having("COUNT(reviews.id) > 10")
            .limit(10)
      end
    end
  end
end