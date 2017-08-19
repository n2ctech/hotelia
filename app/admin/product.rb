ActiveAdmin.register Product do
  permit_params :brand_id, :supplier_id, :subcategory_id, :collection_id,
    *Product.locale_columns(:name, :description, :features),
    :code, :all_tags,
    images_attributes: [:id, :file, :_destroy],
    home_slider_image_attributes: [:id, :file, :_destroy]

  index do
    selectable_column
    id_column
    column :name
    column :code
    column :brand
    column :supplier
    column :category
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
      row :category
      row :subcategory
      row :collection
      row :description
      row :features
      row :home_slider_image do
        if product.home_slider_image
          image_tag(product.home_slider_image&.thumb_url)
        end
      end
      table_for product.images do
        column :images do |image|
          image_tag image.file.thumb.url
        end
      end
    end
  end

  form do |f|
    f.inputs "Product Details" do
      Product.locale_columns(:name, :description, :features).each do |column|
        f.input column
      end
      f.input :code
      f.input :brand
      f.input :supplier
      f.input :category
      f.input :subcategory
      f.input :collection
      f.input :all_tags
    end

    f.inputs "HomeSliderImage",
      for: [:home_slider_image, f.object.home_slider_image || Image.new] do |image|
        image.input :file, as: :file,
          hint: image.object.file.thumb.url ?
            image_tag(image.object.file.thumb.url) : ""
    end

    f.inputs "Attachment", :multipart => true do
      f.has_many :images, new_record: true, allow_destroy: true do |image|
        image.input :file, as: :file,
          hint: image.object.file.thumb.url ?
            image_tag(image.object.file.thumb.url) : ""
      end
    end
    f.actions
  end
end
