 # server.R
shinyServer(function(input, output) {
	library(recharts)

	options(shiny.transcode.json = FALSE)

	datasetInput <- reactive({
		#mainTitle <- input$mainTitle
		#subTitle <- input$subTitle
		#titleX <- input$titleX
		#titleX <- input$titleY
		
		titleSetting = list( 
			title = input$title.title,
			subtitle = input$title.subtitle,
			x = input$title.x,
			y = input$title.y
		)
		toolboxSetting = list( 
			show = input$toolbox.show,
			x = input$toolbox.x,
			y = input$toolbox.y,
			orient = input$toolbox.orient,
			readOnly = input$toolbox.readOnly,
			mark = input$toolbox.mark,
			dataZoom = input$toolbox.dataZoom,
			magicType = input$toolbox.magicType,
			restore = input$toolbox.restore,
			saveAsImage = input$toolbox.saveAsImage
		)
		
		legendSetting = list( 
			show = input$legend.show,
			x = input$legend.x,
			y = input$legend.y,
			orient = input$legend.orient,
			data = input$toolbox.data
		)		
		
		calculableSetting = list( 
			calcuable = input$calcuable
		)
		

		return(list(
			titleSetting =titleSetting, 
			toolboxSetting = toolboxSetting,
			calculableSetting = calculableSetting,
			legendSetting = legendSetting
			))
	})
	
	 output$lazePlot <- renderEcharts({
		recharts.init()
		titleSetting <<- datasetInput()$titleSetting
		toolboxSetting <<- datasetInput()$toolboxSetting
		calculableSetting <<- datasetInput()$calculableSetting
		legendSetting <<- datasetInput()$legendSetting

		mm <- recharts:::eTitleSet(tempEchartsObject, optionList=titleSetting)
		mm <- recharts:::eToolboxSet(mm, optionList=toolboxSetting)
		mm <- recharts:::eLegendSet(mm, optionList=legendSetting)
		mm <- recharts:::eCalculableSet(mm, optionList=calculableSetting)
		return(mm)
	})
 })
 
 # runApp("D:/kuaipan/git/recharts/inst/shiny/lazyPlot/")
 
 