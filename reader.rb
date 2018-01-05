

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



#Rodando a aplicação novamente, verificamos que tudo funciona. Mas, como é possível chamarmos o método matches? em todos os objetos da mesma maneira?

#Em Ruby, podemos chamar qualquer método em qualquer objeto, independente de ele ser de um tipo específico. Se o objeto responde (respond_to?) por aquele método (:matches?), ele será invocado normalmente. O nome dessa característica da linguagem é duck typing: não importa qual o tipo do objeto e sim se ele possui o método ou não.

#Uma das vantagens dessa abordagem é não precisar de uma fase de compilação para garantir que o método exista. Contudo, uma desvantagem é que se tal método existe mas executa uma tarefa diferente da imaginada (possui semântica diferente), o método será chamado erroneamente.


#No exercício anterior, criamos um método onde dizemos um tipo para um objeto ao invés de pedir o seu tipo. Na sua opinião, qual a vantagem de se adotar esse tipo de padrão?
#Anwser: Adotando o padrão de dizer um tipo ao invés de pedi-lo (tell don't ask), evitamos quebrar o encapsulamento da classe, isto é, conhecendo mais do que a gente deveria.

#Veja que construtores nos módulos podem ser perigosos. Quando colocamos um construtor num módulo, assumimos muito sobre a forma como esse módulo será utilizado. No entanto, na maioria das vezes, não temos como saber como esse módulo será usado e quais módulos serão combinados com ele. Dependendo do modo como os módulos são incluídos numa classe, o comportamento final pode ser bem estranho! Ao usar herança para definir um construtor comum a diversas classes, temos mais controle sobre essa combinação.

#Um outro perigo que deve ser evitado ao usarmos módulos é escrever módulos que alteram o estado do classe na qual são incluídos. No nosso caso, os construtores dos módulos alteravam o valor de variáveis membro das outras classes. Novamente, isso é perigoso pois não controlamos a forma como os módulos são combinados. Por isso, deve-se evitar ao máximo alterar variáveis membro de uma classe a partir de um módulo. O ideal é que um módulo acesse somente métodos públicos da classe na qual ele vai ser incluído.