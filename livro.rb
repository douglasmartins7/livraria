class Livro
    attr_accessor :titulo, :preco, :ano_lancamento
end

    livro_rails = Livro.new
    livro_rails.preco = 70.00
    livro_rails.titulo = "Agile Web Development with Rails"
    livro_rails.ano_lancamento = 2011

    livro_ruby = Livro.new
    livro_ruby.preco = 60.00
    livro_ruby.titulo = "Programming Ruby 1.9"
    livro_ruby.ano_lancamento = 2010

    livros = [livro_rails, livro_ruby]

    def imprime_nota_fiscal livros
        livros.each do |livro|
            livro.preco = 1.00
            puts "Titulo: #{livro.titulo} - #{livro.preco}"
        end
    end

    imprime_nota_fiscal livros 


