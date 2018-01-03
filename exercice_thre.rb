

# Acabamos de obter uma array contendo os títulos de alguns livros existentes em nosso estoque:


# livros_computacao = ["Agile Web Development with Rails", "Domain Driven Design", "Programming Ruby 1.9", "Agile Web Development with Rails"]

# Desejamos mostrar uma mensagem para o usuário no seguinte estilo: "Olá! Há x títulos distintos na lista de livros!"

# Onde x é o número e títulos que há em nossa array. Poderíamos usar livros_computacao.length para mostrar quantos títulos há na array; contudo repetições seriam consideradas. Será que nesse contexto não seria melhor exibir o tamanho da array sem contar títulos que se repetem?

# Para isso, seria interessante alterar o método length na classe Array ou poderíamos alterar o método somente no objeto livros_computacao? Discuta os pontos e pense nas reponsabilidades: é de responsabilidade de todo objeto array não considerar valores repetidos ou somente do objeto livros_computacao?
# Opinião do Instrutor

# Nesse caso seria interessante modificar o método length somente no objeto livros_computacao. Basicamente, apenas para esse objeto no contexto que temos é interessante que repetições não sejam consideradas. Aparentemente não são todos os objetos do tipo Array que devem desconsiderar elementos repetidos na contagem. Portanto, não faz muito sentido sobrescrevermos o método length na classe Array. Sem contar que se fizéssemos isso poderíamos introduzir erros em outras partes do sistema, que talvez usem o método length de maneira original, considerando repetições.

    

# Baseando-se em sua resposta no exercício anterior, implemente um código para que possamos exibir o tamanho da array

# livros_computacao = ["Agile Web Development with Rails", "Domain Driven Design", "Programming Ruby 1.9", "Agile Web Development with Rails"]

# sem contabilizar títulos repetidos. Cole seu código aqui quando terminar.
# Opinião do Instrutor

# Considerando que é uma boa opção sobrescrevemos o método length somente no objeto livros_computacao, podemos obter um código similar a:


#   def livros_computacao.length
#     unique = []
#     self.each do |item|
#       unique.push(item) unless unique.include?(item)
#     end
#     unique.length

#   end
