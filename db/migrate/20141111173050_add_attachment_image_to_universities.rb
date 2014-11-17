class AddAttachmentImageToUniversities < ActiveRecord::Migration
  def self.up
    change_table :universities do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :universities, :image
  end
end
