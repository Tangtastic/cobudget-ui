expect = require('../support/expect')
sinon = require('sinon-chai')

describe 'Namespace', ->
  before ->
    global.window = {}

  it 'creates a cobudget namespace', ->
    expect(global.window.Cobudget).to.eq(undefined)
    require '../../app/scripts/config/namespace'
    expect(global.window.Cobudget).to.be.an('object')
