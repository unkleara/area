if RUBY_VERSION.to_f >= 1.9 # ;_;
  require 'csv'
else
  require 'rubygems'
  require 'faster_csv'
end

require 'area/array'
require 'area/integer'
require 'area/string'

module Area


  zip_path = File.open(File.join(File.dirname(__FILE__), '..', 'data', 'zipcodes.csv'))
  area_path = File.open(File.join(File.dirname(__FILE__), '..', 'data', 'areacodes.csv'))

    # there is probably a better way to do this...
  if RUBY_VERSION.to_f >= 1.9
    @area_codes = CSV.read(area_path)
    @zip_codes = CSV.read(zip_path)
  else
    @area_codes = FasterCSV.parse(area_path)
    @zip_codes = FasterCSV.parse(zip_path)
  end


  def self.area_codes
    @area_codes
  end

  def self.zip_codes
    @zip_codes
  end

end
