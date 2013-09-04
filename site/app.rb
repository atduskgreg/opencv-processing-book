require 'rubygems'
require 'bundler'
Bundler.require
require './database.rb'

set :root, File.dirname(__FILE__)

get '/' do
	@data = File.read("home.md")
	@landingpage = BlueCloth.new(@data).to_html
	erb :home
end

get '/index' do
	@data = File.read("toc.md")
	@toctext = BlueCloth.new(@data).to_html
	@toc = @toctext.gsub(/https:\/\/github.com\/atduskgreg\/opencv-processing-book\/blob\/master\/book\/[a-z]*\//, "/chapters/").gsub(/\.md/,"")
	erb :index
end

get '/chapters/:q' do
    @data = File.read("#{params[:q]}.md")
    @bodytext = BlueCloth.new(@data).to_html
    # @bodytext = `htmlbook -m -s #{params[:q]}.md`
    @markdown = @bodytext
    # .gsub(/https:\/\/github.com\/atduskgreg\/opencv-processing-book\/blob\/master\/book\/[a-z]*\//, "/chapters/").gsub(/\.md/,"").gsub(/<!--START WIDGET-->/, "</div></div><div id=\"myCarousel\" class=\"carousel slide\" data-interval=\"false\"><div class=\"carousel-inner\"><div class=\"active item\"><div class=\"row-fluid\"><div class=\"block span4\">").gsub(/<!--SLIDEBREAK-->/, "</div></div></div><div class=\"item\"><div class=\"row-fluid\"><div class=\"block span4\">").gsub(/<!--COLBREAK-->/, "</div><div class=\"block span4\">").gsub(/(<div class="block span4">)(\n)/, "\\1").gsub(/(\[)(.*)(\])(\()(#.*)(\))({id=)(.*)(})/, "<a href=\"\\5\" class=\"callout\" id=\"\\8\">\\2<\/a>").gsub(/(<a)( href=".*">.*<\/a>)({id=)(.*)(})/,"\\1 class=\"callout\" id=\"\\4\"\\2").gsub(/<!--END WIDGET-->/, "</div></div></div><a class=\"carousel-control left\" href=\"#myCarousel\" data-slide=\"prev\">&lsaquo;</a><a class=\"carousel-control right\" href=\"#myCarousel\" data-slide=\"next\">&rsaquo;</a></div><div id=\"container\" class=\"row-fluid\"><div class=\"span8 offset2\">")
    erb :chapter
end