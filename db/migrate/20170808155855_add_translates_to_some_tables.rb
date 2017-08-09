class AddTranslatesToSomeTables < ActiveRecord::Migration[5.1]
  def change
    translate :brands, :description, :text
    translate :categories, :name
    translate :subcategories, :name
    translate :collections, :name
    translate :families, :name
    translate :subfamilies, :name
    translate :products, :name
    translate :products, :description, :text
    translate :products, :features, :text
  end

  private

  def translate table, column, type = "string"
    rename_column table, column, "#{column}_en"
    add_column table, "#{column}_es", type
    add_column table, "#{column}_pt", type
  end
end
