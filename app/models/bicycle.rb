class Bicycle < ApplicationRecord
  require 'rest-client'
  require 'json'

  validates :name, presence: true
  validates :style, presence: true
  validates :price, presence: true
  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader

  after_create :check_if_contains_cat, if: -> {self.name.include? "cat"}

  def check_if_contains_cat
    response = RestClient.get('https://catfact.ninja/fact', {accept: :json})
    length = (response.code == 200)? JSON.parse(response.body)["length"] : 99

    self.update_column(:price, (self.price * length / 5))
  end
end
