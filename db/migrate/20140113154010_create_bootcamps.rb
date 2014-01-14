class CreateBootcamps < ActiveRecord::Migration
  def change
    create_table :bootcamps do |t|

      t.timestamps
      t.string   "name"
      t.string   "address"
      t.string   "city"
      t.string   "st_pr"
      t.string   "country"
      t.string   "contact_email"
      t.string   "website_url"
      t.integer  "campaign_id"
      t.float    "lat"
      t.float    "lon"
      t.string   "twitter_handle"
      t.text     "description"
      t.datetime "created_at",                          :null => false
      t.datetime "updated_at",                          :null => false
      t.string   "slug"
      t.string   "primary_language"
      t.integer  "tuition"
      t.integer  "hours"
      t.integer  "city_index"
      t.integer  "weeks"
      t.string   "notes"
      t.boolean  "published",        :default => false
      t.integer  "hours_per_week"
    end
  end
end
