class SiteController < ApplicationController
  def get
    if params[:s] && params[:p]
      site = Site.find(params[:s])
      page = site.pages.where(:path => params[:p]).first
      content = page.content
      html = page.template.content
      blocks = content.match /\{\{block\:(\d+)\}\}/
      if blocks.length > 0
        blocks.each do |b|
          block = page.blocks.find(b[1])
          resp = HTTParty.get(site.url.to_s + page.path.to_s)
          inds = resp.body.match /\<#{block.name}.*class\=\"#{block.class_name}\".*\>(.*?)<\/#{block.name}>/
          content = content.replace "{{block:#{block.id}}}", "<#{block.name} class='#{block.class_name}'>" + inds[1] + "<#{block.name}>"
        end
      end
      html = html.replace /\{\{page\}\}/, content
      render :html => html
    end
  end
end
