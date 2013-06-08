# HolidayTools

This is a wrapper around the alexdunae/holidays gem with a more intuitive API (at least IMO). It uses the region-id's of that gem to filter the results.

## API Description

### Class methods

* **show_regions**  
Generates a list of region-id's and names of that region (country in Englich and sub-region in local name, e.g. Germany/Sachsen) 

### Instance methods

* **new(filter=[])**  
You may supply an array of filter strings. This strings are region-id's (see
above show_regions) or patterns, which will be expanded as regular expressions
 to match region-id's

* **show\_holiday( date )**  
Generates a list of all public holidays for _date_, which is a Date object (e.g. Date.today)

* **show\_week( date )**  
Generates the list of holidays for the week (sunday to saturday), which contains the date 

* **show\_month( date )**  
Generates the list of holidays for the month, which contains the date

* **show\_year( date )**  
Generates the list of holidays for the year, which contains the date

## Installation

Add this line to your application's Gemfile:

    $ gem 'holiday_tools'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install holiday_tools

## Usage

Included in the gem is an executable, which can be used as CLI command.  
Examples:  

    $ holiday_tools 
shows all regions which observe today a public holiday

    $ holiday_tools --date 2013-05-01 --mode m  
shows all holidays in all regions in May, 2013  

    $ holiday_tools --mode y at ge
shows all holidays in the current year in Austria and Germany

    $ holiday_tools --date 2013-05-01 --mode m es_.    
shows all holidays in May, 2013 which are observed only in subregions of Spain

    $ holiday_tools --help
shows the usage hints
 
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
