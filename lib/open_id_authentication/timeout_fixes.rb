# http://trac.openidenabled.com/trac/ticket/156
module OpenID
  @@timeout_threshold = 20

  def timeout_threshold
    @@timeout_threashold
  end

  def timeout_threshold=(value)
    @@timeout_threashold = value
  end

  class StandardFetcher
    def make_http(uri)
      http = @proxy.new(uri.host, uri.port)
      http.read_timeout = http.open_timeout = OpenID.timeout_threshold
      http
    end
  end
end