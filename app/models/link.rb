class Link < ActiveRecord::Base
  validates_presence_of :url
  validates :url, :url => true
  belongs_to :user

  def self.update_read(link_params)
    link = Link.find(link_params[:id])
    if link.read == true
      conn = Faraday.new(:url => 'https://rocky-atoll-70277.herokuapp.com') do |faraday|
        faraday.request  :url_encoded
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end
      conn.post '/api/v1/links', { link: {url: link.url }}
    end
  end
end
