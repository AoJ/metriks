#### js2coffee version 0.2.7
#### ---- bin/metriks.js
true
cli = require('cli').enable('status', 'help', 'version', 'glob', 'timeout')
workDir = (process.env.HOME or '/tmp') + '/metriks'
_ = require('underscore')
cli.parse
  'web-port': [
    false
    'If > 0, run a webserver on that port to browse graphs'
    'number'
    0
  ]
  concurrency: [
    false
    'How many plugins to run at once'
    'number'
    5
  ]
  'auto-write-png': [
    false
    'Automatically write png files to png-dir'
    'boolean'
    true
  ]
  'auto-upload-s3': [
    false
    'Automatically upload static files to s3 bucket (requires environment variables, see readme)'
    'boolean'
    false
  ]
  name: [
    false
    'Name of plugin or rrd file'
    'string'
  ]
  'plugin-dir': [
    false
    'Plugin directory. Overrules workDir'
    'path'
    __dirname + '/../plugins'
  ]
  'rrd-dir': [
    false
    'RRD directory. Overrules workDir'
    'path'
    workDir + '/rrd'
  ]
  'png-dir': [
    false
    'Image / HTML directory. Overrules workDir'
    'path'
    workDir + '/png'
  ]

Metriks = require('../index').Metriks
cli.main (args, options) ->
  self = this
  config = {}
  _.each options, (val, key) ->
    camelCased = key.replace(/\-(.)/g, (g) ->
      g[1].toUpperCase()
    )
    config[camelCased] = val
    return

  config.cli = self
  metriks = new Metriks(config)
  metriks.start()
  return

