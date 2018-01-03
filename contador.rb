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