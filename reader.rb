#Rodando a aplicação novamente, verificamos que tudo funciona. Mas, como é possível chamarmos o método matches? em todos os objetos da mesma maneira?

#Em Ruby, podemos chamar qualquer método em qualquer objeto, independente de ele ser de um tipo específico. Se o objeto responde (respond_to?) por aquele método (:matches?), ele será invocado normalmente. O nome dessa característica da linguagem é duck typing: não importa qual o tipo do objeto e sim se ele possui o método ou não.

#Uma das vantagens dessa abordagem é não precisar de uma fase de compilação para garantir que o método exista. Contudo, uma desvantagem é que se tal método existe mas executa uma tarefa diferente da imaginada (possui semântica diferente), o método será chamado erroneamente.