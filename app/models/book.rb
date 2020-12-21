class Book < ActiveRecord::Base

    belongs_to :categories
    belongs_to :authors
    has_many :checkouts
    has_many :users, through: :checkouts

    def author
        Author.find( self.author_id )
    end

    def category
        Category.find( self.category_id )
    end

    def update_author( author_name )
        author = Author.find_by( name: author_name )
        Book.update( self.id, :author_id => author.id )
    end

    def update_category( category_name )
        category = Category.find_by( name: category_name )
        Book.update( self.id, :category_id => category.id )
    end

    def available?
        Checkout.find_by( book_id: self.id, returned: false ).nil?
    end

    def overdue?
        return false if self.available?
        Checkout.find_by( book_id: self.id, returned: false ).due_date < Date.today
    end

end
