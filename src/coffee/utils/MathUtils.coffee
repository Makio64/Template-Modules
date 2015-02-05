class MathUtils

	constructor:()->
		return

	@nextPowerTwo:(value)->
        power = 0

        while(value > Math.pow(2,power))
            power++

        return Math.pow(2,power)