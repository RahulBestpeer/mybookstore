# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_240_730_114_420) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'accounts', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.string 'name', default: '', null: false
    t.bigint 'number', null: false
    t.string 'address', default: '', null: false
    t.string 'type'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.integer 'failed_attempts', default: 0, null: false
    t.string 'unlock_token'
    t.datetime 'locked_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['confirmation_token'], name: 'index_accounts_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_accounts_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_accounts_on_reset_password_token', unique: true
    t.index ['unlock_token'], name: 'index_accounts_on_unlock_token', unique: true
  end

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'authors', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.date 'dob'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'books', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.decimal 'price'
    t.integer 'stock_quntity'
    t.bigint 'author_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['author_id'], name: 'index_books_on_author_id'
  end

  create_table 'books_orders', id: false, force: :cascade do |t|
    t.bigint 'book_id', null: false
    t.bigint 'order_id', null: false
    t.index %w[book_id order_id], name: 'index_books_orders_on_book_id_and_order_id'
  end

  create_table 'carts', force: :cascade do |t|
    t.bigint 'account_id', null: false
    t.bigint 'book_id', null: false
    t.integer 'quantity', default: 1
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['account_id'], name: 'index_carts_on_account_id'
    t.index ['book_id'], name: 'index_carts_on_book_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.date 'date_submit'
    t.integer 'status', default: 0
    t.decimal 'subtotal'
    t.decimal 'tax', default: '18.0'
    t.decimal 'total'
    t.decimal 'shipping', default: '40.0'
    t.bigint 'account_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'stock_quntity'
    t.index ['account_id'], name: 'index_orders_on_account_id'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'books', 'authors'
  add_foreign_key 'carts', 'accounts'
  add_foreign_key 'orders', 'accounts'
end
