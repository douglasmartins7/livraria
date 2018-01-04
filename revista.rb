class Revista
    include Produto
  
    def initialize titulo, preco, ano_lancamento, possui_reimpressao, editora, numero
        @titulo = titulo
        @ano_lancamento = ano_lancamento
        @possui_reimpressao = possui_reimpressao
        @numero = numero
        @preco = calcula_preco preco
        @editora = editora       
    end

    def matches? query
        #query=="revista" || query=="impresso"
        ["revista", "impresso"].include? query
    end

    def possui_reimpressao?
        @possui_reimpressao
    end

end