#base de Orientação a Objetos: dados e comportamento que são relacionados ficam no mesmo lugar.
class Livro
    attr_reader :titulo, :preco, :ano_lancamento
  
    def initialize(titulo, preco, ano_lancamento, possui_reimpressao)
        @titulo = titulo
        @ano_lancamento = ano_lancamento
        @preco = calcula_preco(preco)
        @possui_reimpressao = possui_reimpressao
    end

    def possui_reimpressao?
        @possui_reimpressao
    end

    private
    #regrea de negócio
    def calcula_preco(base)
        if @ano_lancamento < 2000
            base * 0.7
        else
            base
        end
    end

end

    livro_rails = Livro.new("Agile Web Development with Rails", 70.00, 2011, true)

    livro_ruby = Livro.new("Programming Ruby 1.9", 60.00, 2010, true)
   
    livros = [livro_rails, livro_ruby]

    algoritmos = Livro.new("Algoritmos", 100, 1998, true)

    def imprime_nota_fiscal livros
        livros.each do |livro|
            livro.preco = 1.00
            puts "Titulo: #{livro.titulo} - #{livro.preco}"
        end
    end

    def livro_para_newsletter livros
        if livros.ano_lancamento < 1999
            puts "Newsletter/Liquidacao"
            puts livros.titulo
            puts livros.preco
        end
    end

    #imprime_nota_fiscal livros 
    livro_para_newsletter algoritmos 
  
   
   


