module Datey
  class Interrogator

    def initialize(date)
      @date = date.to_date
      @today = Date.today
    end

    #
    # Does the time occur today?
    #
    def today?
      @date == @today
    end

    #
    # Does the time occur tomorrow?
    #
    def tomorrow?
      @date == (@today + 1)
    end

    #
    # Does the time occur yesterday?
    #
    def yesterday?
      @date == (@today - 1)
    end

    #
    # Does the date exist in the full week prior to the current week
    #
    def last_week?
      beginning_of_previous_week = beginning_of_current_week - 7
      @date >= beginning_of_previous_week && @date < beginning_of_previous_week + 7
    end

    #
    # Does the date occur in the last X days not including today?
    #
    def last_x_days?(days)
      @date >= (@today - days) && @date < @today
    end
    
    #
    # Does the date occur in the next X days not including today?
    #
    def next_x_days?(days)
      @date > @today && @date <= (@today + days)
    end

    #
    # Does the date existing in this week.
    #
    def this_week?
      @date >= beginning_of_current_week && @date < beginning_of_current_week + 7
    end

    #
    # Does the date occur next week? Assuming the next Sunday is the 
    # start of the next week.
    #
    def next_week?
      beginning_of_next_week = beginning_of_current_week + 7
      @date >= beginning_of_next_week && @date < beginning_of_next_week + 7
    end

    #
    # Is the time in the past
    #
    def past?
      @date < @today
    end
    
    #
    # Is the time in the future
    #
    def future?
      @date > @today
    end

    private

    def beginning_of_current_week
      @beginning_of_current_week ||= @today - @today.wday
    end

  end
end
