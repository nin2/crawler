require 'uri'
require 'open-uri'

class Request
  
  attr_accessor :url
  def initialize(url)
    @url = url
  end

  def base_url
    # url をパースし，
    # http://www.hogehoge.com/article/index.php?page=1
    # => http://www.hogehoge.com
    # にする．robots.txtを探すために必要
    legal_url = /\Ahttps?:\/\/[\w\-\.]*\.*?[\w]*/
    return url.scan(legal_url).first if legal_url =~ url 
    return false
  end

  def robots
    base_url + "/robots.txt"
  end

  def get_html(base_url)
    # html を取得する．
    open(base_url)
  end
end
