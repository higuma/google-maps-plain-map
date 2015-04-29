# (ugly patch to disable beep on Windows)
oldWrite = process.stdout.write
process.stdout.write = (msg) -> oldWrite.call @, msg.replace('\x07', '')

module.exports = (grunt) ->
  'use strict'

  grunt.util.linefeed = '\n'

  grunt.initConfig
    clean:
      html: ['index.html']
    jade:
      options:
        pretty: true
      compile:
        files:
          'index.html': 'index.jade'
    watch:
      options:
        reload: true
      jade:
        tasks: 'jade'
        files: ['index.jade']

  npms = 'clean jade watch'.split ' '
  grunt.loadNpmTasks "grunt-contrib-#{npm}" for npm in npms

  grunt.registerTask 'default', 'jade'
