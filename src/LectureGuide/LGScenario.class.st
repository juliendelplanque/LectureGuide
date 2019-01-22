Class {
	#name : #LGScenario,
	#superclass : #Object,
	#instVars : [
		'entries'
	],
	#category : #'LectureGuide-Core'
}

{ #category : #adding }
LGScenario >> addEntry: aLGEntry [
	self entries add: aLGEntry
]

{ #category : #accessing }
LGScenario >> entries [
	^ entries
]

{ #category : #accessing }
LGScenario >> entries: anObject [
	entries := anObject
]

{ #category : #initialization }
LGScenario >> initialize [
	super initialize.
	self entries: OrderedCollection new
]

{ #category : #accessing }
LGScenario >> size [
	^ self entries size
]
