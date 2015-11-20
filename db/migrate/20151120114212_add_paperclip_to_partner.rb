class AddPaperclipToPartner < ActiveRecord::Migration
  def change
    add_attachment :partners, :logo
  end
end
