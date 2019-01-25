Class {
	#name : #LGShowCommenterTest,
	#superclass : #TestCase,
	#category : #'LectureGuide-Tests'
}

{ #category : #tests }
LGShowCommenterTest >> testInitialize [
	| entry |
	entry := LGShowCommenter new.
	
	self assert: entry showWindowSelector equals: #showCommenter.
	self assert: entry hideWindowSelector equals: #hideCommenter.
]
