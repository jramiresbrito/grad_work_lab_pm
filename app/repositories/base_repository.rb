require 'csv'

class BaseRepository
  attr_accessor :elements

  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    @next_id = 1

    load_csv if File.exist?(@csv_file)
  end

  def add(item)
    item.id = @next_id
    @elements << item
    @next_id += 1
    save_to_csv
  end

  def all
    @elements
  end

  def find(id)
    @elements[id - 1]
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_file, csv_options) do |row|
      @elements << deserialize(row)
      @next_id += 1
    end
  end

  def save_to_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << @elements.first.class.headers
      @elements.each { |element| csv << element.to_csv_row }
    end
  end
end
