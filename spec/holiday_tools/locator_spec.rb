require 'spec_helper'

describe HolidayTools do
  it 'should deliver the new years day for Austria' do
    date = Date.new(2013, 01, 01)
    filter = ['at']
    holidays = HolidayTools::Locator.new(filter)
    answer = holidays.show_holiday(date)
    answer.size.should == 3
    answer[0].should =~ /Tuesday/
    answer[1].should =~ /Neujahrstag/
    answer[2].should =~ /Austria/
  end
  
  it 'should deliver the whole year for all regions' do
    date = Date.new(2013, 01, 01)
    holidays = HolidayTools::Locator.new
    answer = holidays.show_year(date)
    #puts answer[0]
    answer.flatten!.size.should == 909
  end
  
  it 'should list all available regions' do
    holidays = HolidayTools::Locator.new
    regions = holidays.show_regions
    # p regions
    regions.size.should == 101
    
  end
end