PluginManager = require("./lib/plugin-manager").PluginManager
WebServer = require("./lib/web-server").WebServer
Metriks = (config) ->
  @config = config
  @pluginManager = new PluginManager(@config)
  return
exports = module.exports = Metriks
exports.Metriks = Metriks
Metriks::start = ->
  if @config.graph
    @pluginManager.graph program.graph
  else
    @pluginManager.start()
  if @config.webPort > 0
    webServer = new WebServer(@config)
    webServer.start()
  return
