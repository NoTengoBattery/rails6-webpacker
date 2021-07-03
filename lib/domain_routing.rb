class DomainsRouter
  def initialize(router) = @r = router

  def subdomain(sdomain, &block)
    sdomain = sdomain.try(:to_s)
    if AppConfig::Config::IS_REVIEW || AppConfig::Config::IS_STAGING
      @r.scope(:~) { @r.scope(":subdomain") { @r.scope(:~) { @r.constraints(subdomain: sdomain, &block) } } }
      return
    end
    @r.constraints(subdomain: sdomain, &block)
  end
end
