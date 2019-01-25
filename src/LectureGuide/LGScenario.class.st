Class {
	#name : #LGScenario,
	#superclass : #Object,
	#instVars : [
		'entries'
	],
	#category : #'LectureGuide-Core'
}

{ #category : #sugar }
LGScenario >> , anObject [
	anObject beAddedTo: self.
	^ self
]

{ #category : #adding }
LGScenario >> addEntry: aLGEntry [
	self entries add: aLGEntry
]

{ #category : #adding }
LGScenario >> beAddedTo: aLGScenario [
	"Adds all my entries to the scenario provided as argument."
	self entries do: [ :e | aLGScenario addEntry: e ]
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
