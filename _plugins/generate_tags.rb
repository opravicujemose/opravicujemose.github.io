module Jekyll
  class TagPageGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'tag'
        site.tags.each do |tag, posts|
          site.pages << TagPage.new(site, tag)
        end
      end
    end
  end

  class TagPage < Page
    def initialize(site, tag)
      @site = site
      @base = site.source
      @dir = "tag/#{tag.downcase.gsub(' ', '-')}"
      @name = "index.html"

      self.process(@name)
      self.read_yaml(File.join(@base, '_layouts'), 'tag.html')
      self.data['tag'] = tag
      self.data['title'] = "Oznaka: #{tag}"
    end
  end
end
