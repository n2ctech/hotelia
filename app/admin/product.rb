ActiveAdmin.register Product do
  permit_params :brand_id, :supplier_id, :subcategory_id, :collection_id,
    :name, :description, :code, :features,
    images_attributes: [:id, :file, :_destroy]

  index do
    selectable_column
    id_column
    column :name
    column :code
    column :brand
    column :supplier
    column :subcategory
    column :collection
    actions
  end

  show do
    attributes_table do
      row :name
      row :code
      row :brand
      row :supplier
      row :subcategory
      row :collection
      row :description
      row :features
      table_for product.images do
        column :images do |image|
          image_tag image.file.thumb.url
        end
      end
    end
  end

  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :code
      f.input :brand
      f.input :supplier
      f.input :subcategory
      f.input :collection
      f.input :description
      f.input :features
    end

    f.inputs "Attachment", :multipart => true do
      f.has_many :images, new_record: true, allow_destroy: true do |image|
        image.input :file, as: :file,
          hint: image.object.file.thumb.url ?
            image_tag(image.object.file.thumb.url) : content_tag(:span, "no image")
      end
    end
    f.actions
  end
end
