Class {
	#name : #LGScenarioTest,
	#superclass : #TestCase,
	#instVars : [
		'scenario'
	],
	#category : #'LectureGuide-Tests'
}

{ #category : #running }
LGScenarioTest >> setUp [
	scenario := LGScenario new.
	scenario
		addEntry: LGEntry new;
		addEntry: LGEntry new;
		addEntry: LGEntry new
]

{ #category : #tests }
LGScenarioTest >> testSize [
	self assert: scenario size equals: 3.
]
