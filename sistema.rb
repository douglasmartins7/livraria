require_relative "livro"
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

# livro_rails = Livro.new("Agile Web Development with Rails", 70.00, 2011, true)
# livro_ruby =  Livro.new("Programming Ruby 1.9", 60.00, 2010, true)
algoritmos =  Livro.new("Algoritmos", 100, 1998, true, "editora", "livro")
arquitetura = Livro.new("Introdução À Arquitetura e Design de Software", 70, 2011, true, "editora", "livro")
programmer = Livro.new("The Pragmatic Programmer", 100, 1999, true, "editora", "livro")
ruby = Livro.new("Programming Ruby", 100, 1999, true, "editora", "livro")
revistona = Livro.new("Revista de Ruby", 10, 2012, true, "Revistas", "revista")
# livros  = [livro_rails, livro_ruby]

estoque = Estoque.new
estoque << algoritmos << algoritmos << ruby << programmer << arquitetura << ruby << ruby 
estoque.vende ruby
estoque.vende algoritmos
estoque.vende algoritmos
estoque.vende revistona
puts estoque.livro_que_mais_vendeu_por_titulo.titulo
puts estoque.revista_que_mais_vendeu_por_titulo.titulo
#method delete the type array

puts estoque.maximo_necessario
    
# imprime_nota_fiscal livros 
# livro_para_newsletter algoritmos 
# baratos = mais_barato_que 80
# baratos.each do |livro|
#   puts livro.titulo
# end

# estoque.exporta_csv
puts "GERAL: #{estoque.total}"
# estoque.livros.delete algoritmos
  

  