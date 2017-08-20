ActiveAdmin.register HomeConfig do
  home_product_attributes = [
    :id, :product_id, :_destroy
  ]

  permit_params :promotional_banner_title, :promotional_banner_subtitle,
    :promotional_banner_url,
    home_slider_products_attributes: home_product_attributes,
    home_product_list_1_attributes: home_product_attributes,
    home_product_list_2_attributes: home_product_attributes,
    home_popular_products_attributes: home_product_attributes,
    home_categories_attributes: [
      :id, :category_id, :_destroy
    ],
    promotional_banner_image_attributes: [:id, :file, :_destroy]

  index do
    selectable_column
    id_column
    actions
  end

  show do
    attributes_table do
      row :promotional_banner_title
      row :promotional_banner_subtitle
      row :promotional_banner_url
      row :promotional_banner_image do |home_config|
        if home_config.promotional_banner_image
          image_tag(home_config.promotional_banner_image&.thumb_url)
        end
      end
      table_for home_config.home_slider_products do
        column :home_slider_products do |home_product|
          link_to home_product.product.name,
            admin_product_path(home_product.product)
        end
      end
      table_for home_config.home_product_list_1 do
        column :home_product_list_1 do |home_product|
          link_to home_product.product.name,
            admin_product_path(home_product.product)
        end
      end
      table_for home_config.home_product_list_2 do
        column :home_product_list_2 do |home_product|
          link_to home_product.product.name,
            admin_product_path(home_product.product)
        end
      end
      table_for home_config.home_popular_products do
        column :home_popular_products do |home_product|
          link_to home_product.product.name,
            admin_product_path(home_product.product)
        end
      end
      table_for home_config.home_categories do
        column :home_categories do |home_category|
          link_to home_category.category.name,
            admin_category_path(home_category.category)
        end
      end
    end
  end

  form do |f|
    f.inputs "PromotionalBanner", multipart: true do
      f.input :promotional_banner_title
      f.input :promotional_banner_subtitle
      f.input :promotional_banner_url
      f.inputs "PromotionalBannerImage",
        for: [:promotional_banner_image, f.object.promotional_banner_image || Image.new] do |image|
          image.input :file, as: :file,
            hint: image.object.file.thumb.url ?
              image_tag(image.object.file.thumb.url) : ""
      end
    end

    f.inputs "SliderProducts", multipart: true do
      f.has_many :home_slider_products, new_record: true, allow_destroy: true do |f_product|
        f_product.input :product
      end
    end

    f.inputs "ProductList1" do
      f.has_many :home_product_list_1, new_record: true, allow_destroy: true do |f_product|
        f_product.input :product
      end
    end

    f.inputs "ProductList2" do
      f.has_many :home_product_list_2, new_record: true, allow_destroy: true do |f_product|
        f_product.input :product
      end
    end
    f.inputs "PopularProducts" do
      f.has_many :home_popular_products, new_record: true, allow_destroy: true do |f_product|
        f_product.input :product
      end
    end

    f.inputs "Categories" do
      f.has_many :home_categories, new_record: true, allow_destroy: true do |f_category|
        f_category.input :category
      end
    end
    f.actions
  end
end
