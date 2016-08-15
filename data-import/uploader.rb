require 'celluloid/current'
require 'aws-sdk'
AWS.eager_autoload!

class Uploader
  include Celluloid

  def process(path, remote_path)
    s3 = ::AWS::S3.new
    bucket = s3.buckets['zooniverse-static']
    obj = bucket.objects[remote_path]
    upload path, obj
    raise 'File failed to upload' unless obj.exists?
  end

  def upload(path, obj)
    file = File.open path, 'rb'
    obj.write(content_length: file.size, acl: :public_read) do |buffer, bytes|
      tries = 0
      begin
        buffer.write file.read bytes
      rescue => e
        tries += 1
        if tries < 20
          retry
        else
          raise e
        end
      end
    end
  end
end

pool = Uploader.pool size: 50

to_upload = Dir['/data/cutouts/**/*'].collect do |file|

  {
    path: file,
    remote_path: "www.planetfour.org/subjects/standard/#{ File.basename(file) }"
  }
end

to_upload.reject!{|hash| File.directory?(hash[:path])}

to_upload.map do |hash|
  pool.future.process hash[:path], hash[:remote_path]
end.map &:value
