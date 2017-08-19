class CreateHomeConfigs < ActiveRecord::Migration[5.1]
  def change
    create_table :home_configs do |t|
      t.string :promotional_banner_title
      t.string :promotional_banner_subtitle
      t.string :promotional_banner_url

      t.timestamps
    end
  end
end
