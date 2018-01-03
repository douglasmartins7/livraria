#limpa caracteres especiais se existir algum titulo do livro
class Conversor
    def string_para_alfanumerico (nome)
        nome.gsub /[^\w\s]/,''
    end
end