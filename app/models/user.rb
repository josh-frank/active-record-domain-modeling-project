class User < ActiveRecord::Base

    has_many :checkouts
    has_many :books, through: :checkouts

    def check_out_book( book_title, due_date = Date.today + 14 )
        book_to_check_out = Book.find_by( title: book_title )
        Checkout.create( checkout_date: Date.today, due_date: due_date, book_id: book_to_check_out.id, user_id: self.id )
    end
    
    def return_book( book_title )
        checked_out_book = Book.find_by( title: book_title )
        checkout = Checkout.find_by( book_id: checked_out_book.id )
        Checkout.update( checkout.id, :returned => true )
    end

    def checkout_history
        Checkout.where( user_id: self.id )
    end

    def outstanding_checkouts
        Checkout.where( user_id: self.id, returned: false )
    end

    def borrowed_books
        self.outstanding_checkouts.map{ | checkout | Book.find( checkout.book_id ) }
    end

    def overdue_books
        borrowed_books.select( &:overdue? )
    end

end
