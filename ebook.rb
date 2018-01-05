class Ebook < Produto
      
    def matches? query
        #query=="ebook" || query=="digital"
        ["ebook", "digital"].include? query
    end

end
