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

  #chamada do metodo acima
  #relacionado a transforma int em string
  # puts precos = [30.00, 40.00, 70.00, 59.00]
  # precos_string = []
  # precos.each do |preco|
  # puts preco.class
  # precos_string << preco.para_dinheiro
  # end
  # puts precos_string.to_s