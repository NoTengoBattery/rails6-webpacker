class CacheKey
  def self.file_digest!(file_path)
    rel = Pathname.new(file_path).relative_path_from(Rails.root)
    Rails.cache.fetch([rel, File.mtime(rel)]) do
      key = "#{rel}:#{Base64.urlsafe_encode64(Digest::MD5.file(rel).digest, padding: false)}"
      Rails.logger.info("Cache key refreshed: \"#{key}\"")
      key
    end
  end

  def self.gen!(*args)
    kaller = caller_locations(1..1).first
    file_key = CacheKey.file_digest!(kaller.absolute_path)
    "#{file_key}##{kaller.label}?#{
      Base64.urlsafe_encode64(
        Zlib.deflate(Marshal.dump(args.sort)),
        padding: false
      )
    }"
  end
end
