
#base de Orientação a Objetos: dados(atributos) e comportamento(metodo) que são relacionados ficam no mesmo lugar.
class Livro
    attr_reader :titulo, :preco, :ano_lancamento, :editora
  
    def initialize titulo, preco, ano_lancamento, possui_reimpressao, editora, possui_sobrecapa
        @titulo = titulo
        @ano_lancamento = ano_lancamento
        @possui_reimpressao = possui_reimpressao
        @possui_sobrecapa = possui_sobrecapa
        @preco = calcula_preco preco
        @editora = editora
    end

    def to_csv
        "#{@titulo},#{@ano_lancamento}, #{@preco}"
    end

    def possui_reimpressao?
        @possui_reimpressao
    end

    #E note que só de mudar essa maneira de trabalhar passamos a suportar queries mais complexas:
    #Agora podemos não só classificar pelo tipo do produto vendido como ebook, revista ou livro mas 
    #também por características ou categorias. Uma outra maneira de escrever a comparação seria:
    # def matches? query
    #     ["ebook", "digital"].include? query
    # end

    def matches? query
        #query=="livro" || query=="impresso"
        ["livro", "impresso"].include? query
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


   
   


