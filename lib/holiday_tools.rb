# encoding: utf-8

require "holiday_tools/version"
require "holiday_tools/locator"

module HolidayTools
end # module

# monkey patch to see available regions
module Holidays
  def self.regions
    @@regions
  end
end

