ActiveAdmin.register Page do
  permit_params *Page.locale_columns(:title, :content), :key

  index do
    selectable_column
    id_column
    column :key
    column :title
    actions
  end

  form do |f|
    f.inputs "General" do
      f.input :key, collection: %w[ about_us terms_and_conditions privacy_policy orders_and_returns ]
    end
    f.inputs "English" do
      f.input :title_en
      f.input :content_en
    end
    f.inputs "Spanish" do
      f.input :title_es
      f.input :content_es
    end
    f.inputs "Portugese" do
      f.input :title_pt
      f.input :content_pt
    end
    f.actions
  end
end
