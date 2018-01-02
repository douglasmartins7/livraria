class Livro
    attr_reader :titulo, :preco, :ano_lancamento

    def initialize(titulo, preco, ano_lancamento)
        @titulo = titulo
        @preco = preco
        @ano_lancamento = ano_lancamento
    end
end

    livro_rails = Livro.new("Agile Web Development with Rails", 70.00, 2011)

    livro_ruby = Livro.new("Programming Ruby 1.9", 60.00, 2010)
   
    livros = [livro_rails, livro_ruby]

    def imprime_nota_fiscal livros
        livros.each do |livro|
            livro.preco = 1.00
            puts "Titulo: #{livro.titulo} - #{livro.preco}"
        end
    end

    imprime_nota_fiscal livros 


