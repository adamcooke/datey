require 'datey/formatter'
require 'datey/interrogator'

module Datey
  
  def self.format(date, context = :past)
    Formatter.new(date, context)
  end
  
  def self.interrogate(date)
    Interrogator.new(date)
  end
  
end