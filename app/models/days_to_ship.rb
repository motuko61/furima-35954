class Days_to_ship < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1〜２日で発送' },
    { id: 3, name: '2〜３日で発送' },
    { id: 4, name: '4〜７日で発送' },
  ]
  include ActiveHash::Associations
  has_many :items

end
