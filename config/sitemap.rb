# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://yorch-car-store.herokuapp.com"

SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do

    add vehicles_path, :priority => 0.7, :changefreq => 'daily'
    add posts_path, :priority => 0.6, :changefreq => 'daily'
    add new_user_session_path, :priority => 0.2, :changefreq => 'monthly'
    add new_user_registration_path, :priority => 0.4, :changefreq => 'monthly'

    Vehicle.find_each do |vehicle|
        add vehicle_path(vehicle), :lastmod => vehicle.updated_at
    end
end
