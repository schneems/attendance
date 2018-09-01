require "attendance/version"

module Attendance
end

require 'active_record'

ActiveRecord::Relation
ActiveRecord::Associations::CollectionProxy

module ActiveRecord
  # = Active Record Relation
  class Relation
    alias :blank? :empty?
  end

  # = Active Record Associations::CollectionProxy
  class Associations::CollectionProxy
    alias :blank? :empty?
  end
end
