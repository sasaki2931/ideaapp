RailsAdmin.config do |config|
  config.asset_source = :webpacker
  config.actions do
    dashboard                     
    index                         
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
