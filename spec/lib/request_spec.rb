require 'spec_helper'
require 'crawler'

describe Request do
  context "base_url method" do
    it "正しいurlを投げたらbase_urlを返すこと" do
      new_page = Request.new("http://www.helloworld.com/articles/chapter?page=3&limit=20")
      expect(new_page.base_url).to eq("http://www.helloworld.com")
    end

    it "不正なurlを投げたらfalseを返すこと" do
      new_page = Request.new("ftp://www.helloworld.com/articles/chapter?page=3&limit=20")
      expect(new_page.base_url).to be false
    end
  end

  context "robots method" do
    it "正しいurlを投げたらrobots.txtのurlを返すこと" do
      new_page = Request.new("http://www.helloworld.com/articles/chapter?page=3&limit=20")
      expect(new_page.robots).to eq("http://www.helloworld.com/robots.txt")
    end
  end
end
