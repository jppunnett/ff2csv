require "ff2csv/version"

module Ff2csv

  class FixedRecord2CSV

    FILE_DEF_REGEX = /(\w+)\s+(\d+)\s+(\d+)/
    
    def initialize(spec_file, wrap_with_strings, data_file)
      @spec_file = spec_file
      @wrap_with_strings = wrap_with_strings
      @data_file = data_file
    end

    def convert
      field_defs = build_field_def
      puts csv_header_line(field_defs)
      @data_file.each { |line| puts csv_data_line(line.chomp, field_defs) }
    end

    private

    def csv_data_line(line, field_defs)
      fld_vals = ''
      i = 0
      field_defs.each do |fd|
        i = i + 1
        val = line[(fd.fld_start-1)..(fd.fld_end-1)]
        if val
          fld_vals = fld_vals + (@wrap_with_strings ? "\"#{val}\"" : val)
          fld_vals = fld_vals + ',' if i < field_defs.length
        end
      end
      
      fld_vals
    end

    def csv_header_line(field_defs)
      field_names = ''
      i = 0
      field_defs.each do |fd|
        i = i + 1
        field_names = field_names + fd.fld_name
        field_names = field_names + ',' if i < field_defs.length
      end
      field_names
    end

    def build_field_def
      fld_defs = Array.new
        File.open(@spec_file) do |f|
          f.each_line do |line|
            match = line.match FILE_DEF_REGEX
            fld_defs << FieldDef.new(match[1], match[2].to_i, match[3].to_i) if match != nil
          end
        end
      
      fld_defs
    end

    FieldDef = Struct.new(:fld_name, :fld_start, :fld_end)
  end
end
