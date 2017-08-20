ActiveAdmin.register Category do
  permit_params *Category.locale_columns(:name), :subfamily_id,
    image_attributes: [:id, :file]

  index do
    selectable_column
    id_column
    column :name
    column :subfamily
    actions
  end

  show do
    attributes_table do
      row :name_en
      row :name_es
      row :name_pt
      row :subfamily
      row :image do |category|
        image_tag(category.image&.thumb_url) if category.image
      end
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs "Category Details" do
      Category.locale_columns(:name).each do |column|
        f.input column
      end
      f.input :subfamily

      f.inputs "Image",
        for: [:image, f.object.image || Image.new] do |image|
          image.input :file, as: :file,
            hint: image.object.file.thumb.url ?
              image_tag(image.object.file.thumb.url) : ""
      end
    end
    f.actions
  end
end
