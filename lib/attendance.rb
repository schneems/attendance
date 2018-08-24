require "attendance/version"

module Attendance
end

require 'active_record'

ActiveRecord::Relation

module ActiveRecord
  # = Active Record Relation
  class Relation
    alias :blank? :empty?

  end
end
