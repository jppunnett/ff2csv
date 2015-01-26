# ff2csv

ff2csv converts fixed-length-records to Comma Separated Values (CSV) format.

I typically use ff2csv to review DAT files that an iSeries program generates.
Converting it to CSV makes it easy to analyze the data, easier to share and
easier to import into other tools (a DB, Excel, etc)

## Installation

Add this line to your application's Gemfile:

    gem 'ff2csv'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ff2csv

## Usage

The following command reads each line in records.dat and writes each 
line in CVS format to STDOUT, while using the fixed-length-record format 
described in record_format.txt

   ff2csv record_format.txt < records.dat

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
