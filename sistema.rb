require_relative "livro"
require_relative "revista"
require_relative "ebook"
require_relative "estoque"
require_relative "float"

def imprime_nota_fiscal livros
      livros.each do |livro|
          livro.preco = 1.00
          puts "Titulo: #{livro.titulo} - #{livro.preco}"
      end
end

def livro_para_newsletter livro
      if livro.ano_lancamento < 2000
          puts "Newsletter/Liquidacao"
          puts livro.titulo
          puts livro.preco
          puts livro.possui_reimpressao?
      end
end

algoritmos =  Livro.new("Algoritmos", 100, 1998, true, "", true)
arquitetura = Livro.new("Introdução À Arquitetura e Design de Software", 70, 2011, true, "", false)
programmer = Livro.new("The Pragmatic Programmer", 100, 1999, true, "", false)
ruby = Livro.new("Programming Ruby", 100, 2004, true, "", false)
revistona = Revista.new("Revista de Ruby", 10, 2012, true, "Revistas", 3)
online_arquitetura = Ebook.new("Introdução a Arquitetura e Design de Software", 50, 2012, "")


estoque = Estoque.new
estoque << algoritmos << algoritmos << ruby << programmer << arquitetura << ruby << ruby << online_arquitetura
estoque.vende ruby
estoque.vende algoritmos
estoque.vende algoritmos
estoque.vende revistona
estoque.vende online_arquitetura

# estoque << livro << revistona
# estoque.vende livro
# estoque.vende revistona

puts estoque.livro_que_mais_vendeu_por_titulo.titulo
puts estoque.revista_que_mais_vendeu_por_titulo.titulo
puts estoque.ebook_que_mais_vendeu_por_titulo.titulo
puts estoque.respond_to?(:ebook_que_mais_vendeu_por_titulo)

#method delete the type array

#puts estoque.maximo_necessario
    
# imprime_nota_fiscal livros 
# livro_para_newsletter algoritmos 
# baratos = mais_barato_que 80
# baratos.each do |livro|
#   puts livro.titulo
# end

# estoque.exporta_csv
#puts "GERAL: #{estoque.total}"
# estoque.livros.delete algoritmos
  

  