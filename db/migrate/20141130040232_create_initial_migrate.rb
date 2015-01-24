class CreateInitialMigrate < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true

    # 団体情報
    create_table :groups do |t|
      t.string :name
      t.string :master_name
      t.string :address
      t.string :tel
      t.string :url
      t.string :mail
      t.string :activity
      t.timestamps
    end

    # メンバー
    create_table :members do |t|
      t.string :name
      t.string :mail
      t.timestamps
    end

    # 記事
    create_table :articles do |t|
      t.string :title
      t.string :discription
      t.text :article
      t.attachment :photo
      t.integer :member_id
      t.integer :genre_id
      t.integer :area_id
      t.integer :group_id
      t.integer :spiciness
      t.timestamps
    end

    # 体験レポート
    create_table :reports do |t|
      t.string     :name
      t.string     :title
      t.text       :article
      t.attachment :photo
      t.integer    :article_id
      t.timestamps
    end

    # 記事の画像
    create_table :article_images do |t|
      t.string :title
      t.string :discription
      t.attachment :image
      t.timestamps
    end

    # ジャンル
    create_table :genres do |t|
      t.string :name
      t.string :css_class
      t.timestamps
    end

    # 路線
    create_table :lines do |t|
      t.string :name
      t.timestamps
    end

    # 地域
    create_table :areas do |t|
      t.string :name
    end

    # 記事と路線の関連付け
    create_table :article_lines do |t|
      t.integer :article_id
      t.integer :line_id
      t.timestamps
    end

    # 参加エントリー
    create_table :entry do |t|
      t.string :name
      t.string :mail
      t.string :tel
      t.text   :comment
      t.integer :article_id
      t.timestamps
    end
  end
end
