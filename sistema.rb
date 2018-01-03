require_relative "livro"

class Estoque
    attr_reader :livros
  
    def initialize
        @livros = []
        @livros.extend Contador
    end

    def << (livro)
        @livros << livro if livro
        self
    end

    def remove(livro)
        @livros.delete livro
    end

    def maximo_necessario
        @livros.maximo_necessario
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
end

class Conversor
    def string_para_alfanumerico (nome)
        nome.gsub /[^\w\s]/,''
    end
end



class Float
    #transformar inteiro em string
    #Basicamente, o método para_dinheiro transforma o preço (no caso, self) e adiciona um símbolo monetário à sua frente ("R$"). Também se encarrega de garantir que os preços sejam terminados com dois dígitos no final.
    #Dessa forma, poderíamos iterar pela array e converter pedir para que cada float se converta para uma string que represente um valor monetário:
    def para_dinheiro
      valor = "R$" << self.to_s.tr('.', ',')
      valor << "0" unless valor.match /(.*)(\d{2})$/
      valor
    end
  end

module Contador
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

    attr_reader :maximo_necessario
end


    # livro_rails = Livro.new("Agile Web Development with Rails", 70.00, 2011, true)
    # livro_ruby =  Livro.new("Programming Ruby 1.9", 60.00, 2010, true)
    algoritmos =  Livro.new("Algoritmos", 100, 1998, true)
    arquitetura = Livro.new("Introdução À Arquitetura e Design de Software", 70, 2011, true)
    programmer = Livro.new("The Pragmatic Programmer", 100, 1999, true)
    ruby = Livro.new("The Pragmatic Programmer", 100, 1999, true)
    # livros  = [livro_rails, livro_ruby]

    estoque = Estoque.new
    estoque << algoritmos
    puts estoque.livros.maximo_necessario
    estoque << arquitetura
    puts estoque.livros.maximo_necessario
    estoque << programmer << ruby
    puts estoque.livros.maximo_necessario
    #method delete the type array
    estoque.remove algoritmos
    puts estoque.maximo_necessario
    
  
    def imprime_nota_fiscal livros
        livros.each do |livro|
            livro.preco = 1.00
            puts "Titulo: #{livro.titulo} - #{livro.preco}"
        end
    end

    def livro_para_newsletter livro
        if livro.ano_lancamento < 2000
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
  

    #relacionado a transforma int em string
    # puts precos = [30.00, 40.00, 70.00, 59.00]
    # precos_string = []
    # precos.each do |preco|
    #     puts preco.class
    #     precos_string << preco.para_dinheiro
    # end
    # puts precos_string.to_s