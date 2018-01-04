require_relative "contador"

class Estoque
    attr_reader :livros
  
    def initialize
        @livros = []
        @vendas = []
        @livros.extend Contador
    end

    def << (livro)
        @livros << livro if livro
        self
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

    def quantidade_de_vendas_de_titulo produto
        @vendas.count { |venda| venda.titulo == produto.titulo }
    end

    #quando chamamos um metodo de um objeto que não existe, o ruby chama esse metodo method_missing
    #e nos passa o nome dele
    def method_missing(name)
        #(.+) estamos dizendo que queremos qualquer coisa que mais vendeu por qualquer campo
        #transformar o simbolo (name) em uma string com o método to_s e verificar se ele é uma chamada ao método que_mais_vendeu_por titulo, editora ou ano de lançamento.
        matcher = name.to_s.match "(.+)_que_mais_vendeu_por_(.+)"
        #para que caso ele tenha um padrão determinado, extraimos seu tipo e campo e fazemos a invocação
        #se este método que está sendo invocado é deste tipo, caso seja faremos algo
        if matcher
            # Agora dentro de nossa lógica, caso seja um método do tipo que_mais_vendeu_por precisamos
            # saber qual o seu tipo (se é uma revista, livro ou ebook) 
            # e também seu campo (titulo, ano_lancamento, preço)
            # e chamamos o método que_mais_vendeu_por passando o título e campo recebido:
            tipo = matcher[1]
            campo = matcher[2].to_sym #pois precisamos converter para simbolo
            que_mais_vendeu_por(tipo, &campo)
        else
            #caso contrario delego para o metodo pai(object)
            super
        end
    end

    #Isso ocorre porque toda vez que implementamos o method_missing para mudar o comportamento de 
    # métodos, precisamos sobrescrever também o método respond_to?. Então, em nosso caso, precisamos
    # verificar se a chamada de método for equivalente ao método que esperamos ou se nossa classe pai 
    # responde por este método, e então devolvemos o nome do método.

    # que verifique se o método que estamos chamando é equivalente ao que esperamos, ou se nossa 
    # classe pai (super) responde por este método
    def respond_to?(name)
        #se o método resultar com um match perfeito, ele devolve uma string
        #A pratica do ! ou !! transforma o objeto em true ou false
        #Isto é, se ele é vazio, ele vira true, que vira false. Se ele é uma string, vira false, que vira true.
        #se há um objeto, retorna true, se não, false.
        matched = name.to_s.match("(.+)_que_mais_vendeu_por_(.+)")
        !!matched || super
    end

    def vende livro
        @livros.delete livro
        @vendas << livro
    end

    def maximo_necessario
        @livros.maximo_necessario
    end


    private 
    #lambda
    # Observe agora que os métodos que_mais_vendeu_por e quantidade_de_vendas_por não 
    # são chamados de fora de nossa classe, então vamos passa-los pra um escopo privado, 
    # para que não sejam invocados por outras classes:
    def quantidade_de_vendas_por(produto, &campo)
        @vendas.count { |venda| campo.call(venda) == campo.call(produto) }
    end

    #Ao invés de buscar por um tipo específico, perguntando que tipo ele é (ask), iremos dizer a ele
    # um tipo, e o próprio produto verifica se ele é do mesmo tipo que passamos, isto é, se tem um 
    # match entre os tipos. Dessa maneira, não quebramos o encapsulamento da classe.
   def que_mais_vendeu_por tipo, &campo
        @vendas.select { |produto| produto.matches?(tipo)}.sort {|v1,v2|
            quantidade_de_vendas_por(v1, &campo) <=>
            quantidade_de_vendas_por(v2, &campo)
        }.last
    end

end