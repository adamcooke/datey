require 'datey/formatter'
require 'datey/interrogator'

module Datey
  
  def self.format(date)
    Formatter.new(date)
  end
  
  def self.interrogate(date)
    Interrogator.new(date)
  end
  
end