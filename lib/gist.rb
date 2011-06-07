require 'rest_client'
# Based on some of the code in http://github.com/devver/germinate-gist/
class Gist

  GISTS_URL         = 'https://gist.github.com/gists/'
  NEW_GIST_URL      = 'https://gist.github.com/api/v1/xml/new'
  EXISTING_GIST_URL = 'https://gist.github.com/api/v1/xml/'
  PUBLIC_GIST_URL   = 'https://gist.github.com/'
  GITHUB_LOGIN      = ENV['GITHUB_LOGIN']
  GITHUB_TOKEN      = ENV['GITHUB_TOKEN']

  def initialize(name, data, gist_id = nil)
    # @git = Git.init
    @data = data
    @name = name
    @gist_id = gist_id
  end

  def github_login
    GITHUB_LOGIN
  end

  def github_token
    GITHUB_TOKEN
  end

  def publish
    if @gist_id.nil?
      post_gist
    else
      put_gist
    end
  end

  private

  def gist_data
    {
      'file_ext' => {
        name_with_underscores => ".html"
      },
      'file_name' => {
        name_with_underscores => name_with_underscores + ".html"
      },
      'file_contents' => {
        name_with_underscores => @data
      },
      'login' => github_login,
      'token' => github_token
    }
  end

  def name_with_underscores
    @name.gsub(/ /,"_")
  end

  def post_gist
    gists = RestClient::Resource.new(NEW_GIST_URL)
    response = gists.post(gist_data)
    Rails.logger.info "Gist Response:\n#{response}"
    extract_gist_id(response)
  end

  # See http://support.github.com/discussions/gist/65-update-gists-in-the-api
  def put_gist
    begin
      gist = RestClient::Resource.new(GISTS_URL + @gist_id)
      response = gist.put(gist_data)
    rescue RestClient::Found
      Rails.logger.debug "Gist PUT response:\n#{response}"
      Rails.logger.info "Gist #{gist_public_url(@gist_id)} updated"
    rescue RestClient::MovedPermanently
      Rails.logger.debug "Gist PUT response:\n#{response}"
      Rails.logger.info "Gist #{gist_public_url(@gist_id)} updated ... maybe"
    end
    @gist_id
  end

  def extract_gist_id(response)
    Nokogiri::XML.parse(response).xpath('//repo').first.content
  end

  def gist_public_url(gist_id)
    PUBLIC_GIST_URL + gist_id
  end
end
