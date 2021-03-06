// Generated by CoffeeScript 1.4.0
(function() {
  var basename, fs, join, require_directory, resolve, _ref;

  fs = require('fs');

  _ref = require('path'), join = _ref.join, resolve = _ref.resolve, basename = _ref.basename;

  module.exports = require_directory = function(directory) {
    directory = resolve(directory);
    return fs.readdirSync(directory).reduce(function(hash, file) {
      var file_extension, file_name, file_path, key, value, _ref1;
      file_path = join(directory, file);
      file_name = file.substring(0, file.lastIndexOf('.'));
      file_extension = file.substring(file.lastIndexOf('.'));
      if (fs.statSync(file_path).isDirectory()) {
        hash[basename(file_path)] = require_directory(file_path);
      } else {
        if (file_extension !== '.coffee' && file_extension !== '.js') {
          return hash;
        } else if (file_name === 'index' && typeof require(file_path) === 'object') {
          _ref1 = require(file_path);
          for (key in _ref1) {
            value = _ref1[key];
            hash[key] = value;
          }
        } else {
          hash[file_name] = require(file_path);
        }
      }
      return hash;
    }, {});
  };

}).call(this);
