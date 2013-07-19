fs = require 'fs'
{join, resolve, basename} = require 'path'

module.exports = require_directory = (directory) ->
	directory = resolve(directory)
	fs.readdirSync(directory).reduce (hash, file) ->
		file_path = join(directory, file)
		file_name = file.substring(0, file.lastIndexOf('.'))
		if fs.statSync(file_path).isDirectory()
			hash[basename(file_path)] = require_directory(file_path)
		else
			hash[file_name] = require(file_path)
		return hash
	, {}


