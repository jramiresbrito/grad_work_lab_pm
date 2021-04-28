class Aluno
  attr_reader :nome
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @nome = attributes[:nome]
  end

  def to_csv_row
    [@id, @nome]
  end

  def self.headers
    %w[id nome]
  end
end
