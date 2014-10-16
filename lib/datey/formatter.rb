require 'date'
require 'datey/interrogator'

module Datey
  class Formatter

    def initialize(time)
      @time = time
    end
    
    #
    # Return the date and time
    #
    def date_and_time
      "#{date} at #{time}"
    end
    
    # 
    # Return the time nicely
    #
    def time
      if @time.is_a?(Time)
        @time.strftime("%l#{@time.min > 0 ? ":%M" : ''}%P").strip
      else
        nil
      end
    end
    
    #
    # Return the formatted date (no time)
    #
    def date
      if interrogator.today?
        "Today"
      elsif interrogator.yesterday?
        "Yesterday"
      elsif interrogator.tomorrow?
        "Tomorrow"
      elsif interrogator.last_x_days?(7)
        "Last #{name_of_day}"
      elsif interrogator.next_x_days?(6)
        name_of_day
      elsif interrogator.next_week?
        "Next #{name_of_day}"
      else
        string = "#{name_of_day} #{day_of_month} #{name_of_month}"
        string += " #{@time.year}" if include_year_in_dates?
        string
      end
    end
    
    #
    # Return the day of the month ordinalized
    #
    def day_of_month
      ordinal = case @time.day
      when 1 then "st"
      when 2 then "nd"
      when 3 then "rd"
      else "th"
      end
      "#{@time.day}#{ordinal}"
    end
    
    #
    # Return the name of the day
    #
    def name_of_day(style = :full)
      @time.strftime(style == :full ? "%A" : "%a")
    end
    
    #
    # Return the name of the month
    #
    def name_of_month(style = :full)
      @time.strftime(style == :full ? "%B" : "%b")
    end
    
    private
    
    #
    # Return an interrogator object for the date we're formatting
    #
    def interrogator
      @interrogator ||= Interrogator.new(@time.to_date)
    end
    
    #
    # Should years be included in dates?
    #
    def include_year_in_dates?
      if @time.year != Date.today.year
        # If the year was in the past, always include the year 
        return true
      end
      
      if @time.year == Date.today.year && @time.month < (Date.today.month - 4)
        # If the year is this year, include if it happened more than 6 months
        # ago.
        return true
      end
    end
    
  end
end