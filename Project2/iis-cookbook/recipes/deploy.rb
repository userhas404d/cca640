chef_gem "aws-sdk-s3" do
    compile_time false
    action :install
  end
  
  ruby_block "download-object" do
    block do
      require 'aws-sdk-s3'
  
      #1  
      # Aws.config[:ssl_ca_bundle] = 'C:\ProgramData\Git\bin\curl-ca-bundle.crt'
      Aws.use_bundled_cert!
  
      #2  
      query = Chef::Search::Query.new
      app = query.search(:aws_opsworks_app, "type:other").first
      s3region = app[0][:environment][:S3REGION]
      s3bucket = app[0][:environment][:BUCKET]
      s3filename = app[0][:environment][:FILENAME]
  
      #3  
      s3_client = Aws::S3::Client.new(region: s3region)
      puts "downloading object #{s3filename} from #{s3bucket}.."
      s3_client.get_object(bucket: s3bucket,
                           key: s3filename,
                           response_target: 'C:\inetpub\wwwroot\default.htm')
    end 
    action :run
  end