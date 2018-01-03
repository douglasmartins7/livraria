
#base de Orientação a Objetos: dados(atributos) e comportamento(metodo) que são relacionados ficam no mesmo lugar.
class Livro
    attr_reader :titulo, :preco, :ano_lancamento
  
    def initialize titulo, preco, ano_lancamento, possui_reimpressao
        @titulo = titulo
        @ano_lancamento = ano_lancamento
        @preco = calcula_preco preco
        @possui_reimpressao = possui_reimpressao
    end

    def to_csv
        "#{@titulo},#{@ano_lancamento}, #{@preco}"
    end

    def possui_reimpressao?
        @possui_reimpressao
    end

    private
    #regra de negócio
    def calcula_preco base
        if @ano_lancamento < 2006
            if @possui_reimpressao
                base * 0.9
            else
                base *0.95
            end
        elsif @ano_lancamento <=2010
            base * 0.96
        else
            base
        end
    end
end

class Estoque
    attr_reader :livros
  
    def initialize
        @livros = []
    end

    #usa o princípio Tell, Don't Ask. Ele não pergunta mais nada para o objeto livro apenas manda
    def exporta_csv 
        @livros.each do |livro|
            puts livro.to_csv
        end
    end

    def mais_barato_que valor
        #     O resultado é um novo array
        #     somente com os elementos que,
        #     passados para o bloco, fazem ele devolver true.
        @livros.select do |livro|
            livro.preco <= valor
        end
    end

    def total
        @livros.size
    end

    def adiciona livro
        @livros << livro if livro
    end
end

class Array
    attr_reader :maximo_necessario
    #Houve uma sobreescrita no metodo << do tipo array que devolvia ele mesmo
    def << (livro)
        push (livro)
        if @maximo_necessario.nil? || @maximo_necessario < size
            @maximo_necessario = size
        end
        #ele precisa devolver o proprio array para não permitir que o metodo atual 
        #quebre a compatibilidade com o << o original
        self
    end
end


    # livro_rails = Livro.new("Agile Web Development with Rails", 70.00, 2011, true)
    # livro_ruby =  Livro.new("Programming Ruby 1.9", 60.00, 2010, true)
    algoritmos =  Livro.new("Algoritmos", 100, 1998, true)
    arquitetura = Livro.new("Introdução À Arquitetura e Design de Software", 70, 2011, true)
    programmer = Livro.new("The Pragmatic Programmer", 100, 1999, true)
    ruby = Livro.new("The Pragmatic Programmer", 100, 1999, true)
    # livros  = [livro_rails, livro_ruby]

    estoque = Estoque.new
    estoque.livros << algoritmos
    puts estoque.livros.maximo_necessario
    estoque.livros << arquitetura
    puts estoque.livros.maximo_necessario
    estoque.livros << programmer << ruby
    puts estoque.livros.maximo_necessario
    #method delete the type array
    estoque.livros.delete algoritmos
    puts estoque.livros.maximo_necessario
    
  
    def imprime_nota_fiscal livros
        livros.each do |livro|
            livro.preco = 1.00
            puts "Titulo: #{livro.titulo} - #{livro.preco}"
        end
    end

    def livro_para_newsletter livro
        if livro.ano_lancamento < 1999
            puts "Newsletter/Liquidacao"
            puts livro.titulo
            puts livro.preco
            puts livro.possui_reimpressao?
        end
    end

    #imprime_nota_fiscal livros 
    #livro_para_newsletter algoritmos 
 
    # baratos = mais_barato_que 80
    # baratos.each do |livro|
    #     puts livro.titulo
    # end

    # estoque.exporta_csv
    # estoque.total
    # estoque.livros.delete algoritmos
  
   
   


