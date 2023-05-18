ActiveAdmin.register Bicycle do
  permit_params :name, :description, :price, :style, :photo

  index do
    id_column
    column :name
    column :price
    column :style
    actions
  end

  filter :name
  filter :price
  filter :style

  form do |f|
    f.semantic_errors *f.object.errors.attribute_names

    f.inputs do
      f.input :name
      f.input :description
      f.input :style
      f.input :price
      f.input :photo
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :style
      row :price
      row :photo do |obj|
        (obj.photo.present?) ? (image_tag obj.photo.url(:small)) : nil
      end
      row :created_at
    end
  end
end
