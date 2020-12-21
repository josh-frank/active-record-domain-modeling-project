class CreateCheckouts < ActiveRecord::Migration[5.2]

    def change
        create_table :checkouts do | t |
            t.date :checkout_date
            t.date :due_date
            t.boolean :returned, default: false
            t.integer :book_id
            t.integer :user_id
        end
    end

end