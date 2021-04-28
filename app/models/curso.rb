class Curso
  module PrecoDeCursos
    PRECO_BASE = 100.00
    TIPO_0 = PRECO_BASE * 1.00
    TIPO_1 = TIPO_0 * 1.40
    TIPO_2 = TIPO_1 * 1.20
  end

  attr_reader :nome, :tipo, :preco, :numero_de_aulas, :numero_de_provas
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @nome = attributes[:nome]
    @tipo = attributes[:tipo].to_i
    @numero_de_aulas = attributes[:numero_de_aulas].to_i
    @numero_de_provas = attributes[:numero_de_provas].to_i

    set_preco
  end

  def to_csv_row
    [@id, @nome, @tipo, @preco]
  end

  def self.headers
    %w[id nome tipo preco numero_de_aulas numero_de_provas]
  end

  private

  def set_preco
    @preco = Curso::PrecoDeCursos::TIPO_0 if @tipo == 0
    @preco = Curso::PrecoDeCursos::TIPO_1 if @tipo == 1
    @preco = Curso::PrecoDeCursos::TIPO_2 if @tipo == 2
  end
end
