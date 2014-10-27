create_table :tips, force: true do |t|
  t.integer  :target, null: false
  t.string   :title, null: false
  t.string   :partial_name, null: false
  t.integer  :icon_name, null: false
  t.datetime :created_at, null: false
  t.datetime :updated_at, null: false
end