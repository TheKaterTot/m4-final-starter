class HotLinksService
  def self.get_hot_links
    response = Faraday.get('https://rocky-atoll-70277.herokuapp.com/api/v1/links')
    JSON.parse(response.body).map do |link|
      link["url"]
    end
  end
end
