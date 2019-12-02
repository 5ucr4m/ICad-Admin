# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.find(slug)
    find_by(slug: slug)
  end
end
