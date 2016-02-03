require 'nokogiri'
require 'rest-client'

class WebScrapper
  attr_reader :url, :page, :ext_links, :other_links

  def initialize(url, http_method = :get, params = {})
    @url = url
    @page = Nokogiri::HTML(RestClient.method(http_method.to_sym).call(url, params))
  end

  def tags(name)
    page.css(name)
  end

  def external_links
    links
    @ext_links
  end

  def internal_links
    links
    @other_links
  end

  private

  def links
    return unless ext_links.nil? && other_links.nil?
    @ext_links = []
    @other_links = []
    tags('a').each do |tag|
      value = tag.attribute('href').value
      external = external?(value)
      ext_links << value if external
      other_links << value unless external
    end
  end

  def external?(url)
    URI.parse(url).absolute?
  end
end
