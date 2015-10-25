# kent beck did this short test suite in making making coffeescript

class unit
    runCount: 0
    failCount: 0
    assert: (flag) ->
        throw new Error if not flag
    @runAll: (tests) ->
        result = new unit
        result.runTest test for test in tests
        result
    @run: (test) ->
        unit.runAll [test]
    runTest: (test) ->
        this.runCount++
        try
            test()
        catch
            this.failCount++

# self-tests

thrown = false
result = new unit
try
    unit.assert false
catch
    thrown = true
throw new Error if not thrown

result = unit.run -> 
result.assert result.runCount is 1
result.assert result.failCount is 0

result = unit.run -> throw new Error
result.assert result.runCount is 1
result.assert result.failCount is 1

noop = ->
result = unit.runAll [noop, noop]
result.assert result.runCount is 2
result.assert result.failCount is 0

oops = -> throw new Error
result = unit.runAll [oops, noop]
result.assert result.runCount is 2
result.assert result.failCount is 1

result = unit.runAll [->]
result.assert result.runCount is 1
result.assert result.failCount is 0


module.exports = unit

console.log 'unit.coffee says Success !!!'
