require_relative './file_handler'
require_relative '../book'

class FileReader
  def initialize(file)
    @file = file
  end

  def read_data
    dir = FileHandler.check_or_make_directory
    list = []
    return [] unless File.exist?("#{dir}/#{@file}")

    File.foreach("#{dir}/#{@file}") do |line|
      line = JSON.parse(line.to_json)
      object = nil
      JSON.parse(line).each do |var, val|
        next unless var == 'class'

        instance = Object.const_get(val)
        object = instance.new(*1..instance.instance_method(:initialize).parameters.length)
      end
      object.from_json!(line)
      list << object
    end
    list
  end
end
