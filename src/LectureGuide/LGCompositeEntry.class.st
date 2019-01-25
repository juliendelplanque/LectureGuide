Class {
	#name : #LGCompositeEntry,
	#superclass : #LGEntry,
	#instVars : [
		'entries'
	],
	#category : #'LectureGuide-Entries'
}

{ #category : #'instance creation' }
LGCompositeEntry class >> fromSton: stonReader [
	| array |
	array := Array streamContents: [ :stream |
		stonReader parseListDo: [ :each :index | stream nextPut: each ] ].
	
	^ self new
		entries: array;
		yourself
]

{ #category : #arithmetic }
LGCompositeEntry >> + aLGEntry [
	self entries add: aLGEntry.
	^ self
]

{ #category : #composing }
LGCompositeEntry >> center [
	self checkLastEntryIsKindOf: LGResizeWindow toComposeWith: LGPositionWindow.
	
	^ self + (LGPositionWindow windowSelector: self lastEntry windowSelector) center
]

{ #category : #checks }
LGCompositeEntry >> checkLastEntryIsKindOf: aClass toComposeWith: anEntryClass [
	self checkLastEntryIsKindOfAny: { aClass } toComposeWith: anEntryClass
]

{ #category : #checks }
LGCompositeEntry >> checkLastEntryIsKindOfAny: aCollectionOfClasses toComposeWith: anEntryClass [
	aCollectionOfClasses
		detect: [ :anyClass | self lastEntry isKindOf: anyClass ]
		ifNone: [
			LGNonComposableEntries
				signalEntry: self lastEntry class canNotBeComposedWith: anEntryClass ]
]

{ #category : #composing }
LGCompositeEntry >> downLeft [
	self checkLastEntryIsKindOf: LGResizeWindow toComposeWith: LGPositionWindow.
	
	^ self + (LGPositionWindow windowSelector: self lastEntry windowSelector) downLeft
]

{ #category : #composing }
LGCompositeEntry >> downRight [
	self checkLastEntryIsKindOf: LGResizeWindow toComposeWith: LGPositionWindow.
	
	^ self + (LGPositionWindow windowSelector: self lastEntry windowSelector) downRight
]

{ #category : #accessing }
LGCompositeEntry >> entries [
	^ entries
]

{ #category : #accessing }
LGCompositeEntry >> entries: anObject [
	entries := anObject
]

{ #category : #accessing }
LGCompositeEntry >> lastEntry [
	^ self entries last
]

{ #category : #running }
LGCompositeEntry >> revert [
	self entries reverseDo: [ :entry |
		entry
			scenarist: self scenarist;
			revert ]
]

{ #category : #running }
LGCompositeEntry >> run [
	self entries do: [ :entry |
		entry
			scenarist: self scenarist;
			run ]
]

{ #category : #'ston persistence' }
LGCompositeEntry >> stonOn: stonWriter [
	stonWriter
		writeObject: self streamList: [ :list |
			self entries do: [ :e | list add: e ] ]
]

{ #category : #composing }
LGCompositeEntry >> topLeft [
	self checkLastEntryIsKindOf: LGResizeWindow toComposeWith: LGPositionWindow.
	
	^ self + (LGPositionWindow windowSelector: self lastEntry windowSelector) topLeft
]

{ #category : #composing }
LGCompositeEntry >> topRight [
	self checkLastEntryIsKindOf: LGResizeWindow toComposeWith: LGPositionWindow.
	
	^ self + (LGPositionWindow windowSelector: self lastEntry windowSelector) topRight
]
