Class {
	#name : #LGComposedEntry,
	#superclass : #LGEntry,
	#instVars : [
		'entries'
	],
	#category : #'LectureGuide-Core'
}

{ #category : #'instance creation' }
LGComposedEntry class >> fromSton: stonReader [
	| array |
	array := Array streamContents: [ :stream |
		stonReader parseListDo: [ :each :index | stream nextPut: each ] ].
	
	^ self new
		entries: array;
		yourself
]

{ #category : #arithmetic }
LGComposedEntry >> + aLGEntry [
	self entries add: aLGEntry.
	^ self
]

{ #category : #accessing }
LGComposedEntry >> entries [
	^ entries
]

{ #category : #accessing }
LGComposedEntry >> entries: anObject [
	entries := anObject
]

{ #category : #running }
LGComposedEntry >> revert [
	self entries reverseDo: [ :entry |
		entry
			scenarist: self scenarist;
			revert ]
]

{ #category : #running }
LGComposedEntry >> run [
	self entries do: [ :entry |
		entry
			scenarist: self scenarist;
			run ]
]

{ #category : #'ston persistence' }
LGComposedEntry >> stonOn: stonWriter [
	stonWriter
		writeObject: self streamList: [ :list |
			self entries do: [ :e | list add: e ] ]
]
