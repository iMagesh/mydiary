task :migrate_wp => :environment do
  wp = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "root", :database => "mageshblog")
  results = wp.query("select * from wp_zxdasg_posts;")

  results.each do |r|
    Post.create(
                :user_id => r["author"],
                :date => r["post_date"],
                :content => r["post_content"],
                :title => r["post_title"],
                :status => r["post_status"],
                :excerpt => r["post_excerpt"],
                :comment_status => r["comment_status"],
                :ping_status => r["ping_status"],
                :post_password => r["post_password"],
                :permalink => r["post_title"].parameterize,
                :post_type => r["post_type"],
                :comment_count => r["comment_count"],
                :created_at => r["post_date"]
                )
    puts r["post_title"]
  end

end
