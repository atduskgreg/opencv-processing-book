require 'rubygems'
require 'bundler'
Bundler.require
require './database.rb'

set :root, File.dirname(__FILE__)

get '/chapters/:q' do
    @data = File.read("#{params[:q]}.md")
    @bodytext = BlueCloth.new(@data).to_html
    @markdown = @bodytext.gsub(/<iframe class="widgetframe"/, "</div></div><div><div><iframe class=\"widgetframe\"").gsub(/https:\/\/github.com\/atduskgreg\/opencv-processing-book\/blob\/master\/book\/[a-z]*\//, "/chapters/").gsub(/\.md/,"")
    erb :chapter
end

get '/index' do
	@data = File.read("toc.md")
	@toctext = BlueCloth.new(@data).to_html
	@toc = @toctext.gsub(/https:\/\/github.com\/atduskgreg\/opencv-processing-book\/blob\/master\/book\/[a-z]*\//, "/chapters/").gsub(/\.md/,"")
	erb :index
end

get '/widgets/:q' do
	@title = "#{params[:q]}.pde"
	@files = Dir.glob("#{params[:q]}*.md")
	first_file = @files.shift
	@widgetfirstmd = File.read(first_file)
	@widgetfirsthtml = BlueCloth.new(@widgetfirstmd).to_html
	@widgetfirst = @widgetfirsthtml.gsub(/<!--START BLOCK-->/, "<div class=\"block span4\">").gsub(/<!--END BLOCK-->/, "</div>").gsub(/(<div class="block span4">)(\n)/, "\\1").gsub(/(\[)(.*)(\])(\()(#.*)(\))({id=)(.*)(})/, "<a href=\"\\5\" class=\"callout\" id=\"\\8\">\\2<\/a>").gsub(/(<a)( href=".*">.*<\/a>)({id=)(.*)(})/,"\\1 class=\"callout\" id=\"\\4\"\\2")
	erb :widget
end