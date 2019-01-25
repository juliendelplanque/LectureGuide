Class {
	#name : #LGShowPlaygroundTest,
	#superclass : #TestCase,
	#category : #'LectureGuide-Tests'
}

{ #category : #tests }
LGShowPlaygroundTest >> testInitialize [
	| entry |
	entry := LGShowPlayground new.
	
	self assert: entry showWindowSelector equals: #showPlayground.
	self assert: entry hideWindowSelector equals: #hidePlayground.
]
