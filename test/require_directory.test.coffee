assert = require 'assert'
require_directory = require '../index'
example_directory = './test/example'

describe 'require-directory', ->
	# This is the directory structure:
	#   example/
	#     - hello.coffee
	#     - hi.coffee
	#     - nested/
	#       - bleep.coffee
	#       - index.coffee
	#       - triple
	#         - yeah.coffee
	#         - index.coffee
	#
  it 'should work', ->
    dir = require_directory(example_directory)
    assert.equal dir.hello, 'world',
    assert.equal dir.hi, 'you',
    assert.equal dir.nested.bleep, 'boop'
    assert.equal dir.nested.triple.yeah, 'woo'
    assert.equal dir.nested.get, 'bloop'
    assert.equal dir.nested.triple.index, 'hello'