module VictimUrlsHelper

  def gist_url
    Gist::PUBLIC_GIST_URL + @victim_url.gist_id unless @victim_url.gist_id.blank?
  end

end
