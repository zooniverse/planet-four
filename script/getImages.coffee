request = require('request')
cherio  = require('cheerio')
childProcess = require('child_process')
fs = require('fs')
http = require('http')

class ImageFetecher
	@baseUrl: "http://www.uahirise.org/results.php?keyword=&longitudes=&lon_beg=270&lon_end=290&latitudes=&lat_beg=&lat_end=&solar_all=false&solar_spring=false&solar_summer=false&solar_fall=true&solar_winter=false&solar_equinox=false&solar_equinox_dist=5&solar_solstice=false&solar_solstice_dist=5&solar_beg=&solar_end=&image_all=true&image_anaglyphs=false&image_dtm=false&order=WP.release_date&science_theme=&page=__page__"
	@latRange:[-90,-70]

	@getUrlForParsing:(url,func)=>
		request url , (error,resp, body)=>
			$ = cherio.load(body)
			func($)

	@fetchImages:(outputDir)=>
		@outputDir = outputDir
		for i in [1..13]
			@getUrlForParsing @baseUrl.replace("__page__", i) , @parseIndexPage

	@parseIndexPage:($)=>
		$("td a.cells").each (index, el)=>
			href = $(el).attr("href")
			if href.indexOf('http') == -1 and href.indexOf('php')  == -1
				@getUrlForParsing "http://www.uahirise.org/#{href}", @getJPEGMapProj

	@getJPEGMapProj:($)=>
		imageUrl = $(".page-details-container table td:first-child a").eq(5).attr('href')
		@getImage imageUrl

	@getImage:(url)=>
		if url?
			filename = url.split("/").slice(-1)[0]
			
			@total ||= 0 
			@total += 1

			r = request(url)
			r.pipe(fs.createWriteStream("#{@outputDir}/#{filename}"))
			r.on 'end', =>
				@done ||= 0 
				@done +=1
				console.log "done  #{@done} of #{@total}"
				if @done == @total
					process.exit()

fs.mkdirSync("./data")
ImageFetecher.fetchImages("./data")

