class AddAttachmentValueToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      #t.attachment :value
    end
  end

  def self.down
    remove_attachment :users, :value
  end
end
