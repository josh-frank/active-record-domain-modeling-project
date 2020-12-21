User.destroy_all
User.reset_pk_sequence
Category.destroy_all
Category.reset_pk_sequence
Author.destroy_all
Author.reset_pk_sequence
Book.destroy_all
Book.reset_pk_sequence
Checkout.destroy_all
Checkout.reset_pk_sequence

josh = User.create( name: "Josh" )

thriller = Category.create( name: "Thriller" )
satire = Category.create( name: "Satire" )
drama = Category.create( name: "Drama" )

lecarre = Author.create( name:"John le Carré" )
vonnegut = Author.create( name: "Kurt Vonnegut" )
palahniuk = Author.create( name: "Chuck Palahniuk")
shakespeare = Author.create( name: "William Shakespeare" )
williams = Author.create( name: "Tennessee Williams" )

perfect_spy = Book.create( title: "A Perfect Spy" )
perfect_spy.update_author( "John le Carré" )
perfect_spy.update_category( "Thriller" )

slaughterhouse_five = Book.create( title: "Slaughterhouse Five")
slaughterhouse_five.update_author( "Kurt Vonnegut" )
slaughterhouse_five.update_category( "Satire" )

romeo_and_juliet = Book.create( title: "Romeo & Juliet")
romeo_and_juliet.update_author( "William Shakespeare" )
romeo_and_juliet.update_category( "Drama" )

josh.check_out_book( "Slaughterhouse Five", Date.today - 1 )