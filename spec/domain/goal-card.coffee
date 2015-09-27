

domain = require '../domain'
GoalCard = domain.getModel('goal-card')
RoadCard = domain.getModel('road-card')

describe 'GoalCard', ->

    describe 'flip', ->

        before ->

            @goalCard = new GoalCard(left: on, right: off, upper: on, lower: off, isGenuineGoal: false)

            @result = @goalCard.flip()

        it 'returns a RoadCard', ->

            expect(@result).to.be.instanceof RoadCard


        it 'returns a RoadCard and it has the same direction property as GoalCard', ->

            expect(@result).to.have.property 'left', on
            expect(@result).to.have.property 'right', off
            expect(@result).to.have.property 'upper', on
            expect(@result).to.have.property 'lower', off


        it 'returns a RoadCard, with "center": on', ->
            expect(@result).to.have.property 'center', on


        it 'returns a RoadCard, with "isRemovable": no', ->

            expect(@result).to.have.property 'isRemovable', no
