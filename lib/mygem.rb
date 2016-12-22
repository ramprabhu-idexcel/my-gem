require 'active_record'
require 'mygem/version'

module Mygem # :nodoc:
  autoload :Restaurant, 'mygem/restaurant'
  autoload :Review, 'mygem/review'
  autoload :User, 'mygem/user'
  autoload :UserScope, 'mygem/user'

  def self.root
    lib_path = File.dirname(__FILE__)
    Pathname.new(lib_path).join('..')
  end

  def self.load_seeds
    load root.join('db', 'seeds.rb')
  end
end

ActiveRecord::Base.store_full_sti_class = false
