# class Estoque
    
#     def initialize
#         @livros = []
#     end

#     #usa o princípio Tell, Don't Ask. Ele não pergunta mais nada para o objeto livro apenas manda
#     def exporta_csv 
#         @livros.each do |livro|
#             puts livros.to_csv
#         end
#     end

#       def mais_barato_que valor
#         #     O resultado é um novo array
#         #     somente com os elementos que,
#         #     passados para o bloco, fazem ele devolver true.
#         @livros.select do |livro|
#             livro.preco <= valor
#         end
#     end

#     def total
#         @livros.size
#     end

#     def adiciona livro
#         @livros << livro if livro
#     end

# end