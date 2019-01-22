Class {
	#name : #LGComposedEntry,
	#superclass : #LGEntry,
	#instVars : [
		'entries'
	],
	#category : #'LectureGuide-Entries'
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
LGComposedEntry >> fullRevert [
	self entries reverseDo: [ :entry |
		entry
			scenarist: self scenarist;
			fullRevert ]
]

{ #category : #running }
LGComposedEntry >> fullRun [
	self entries do: [ :entry |
		entry
			scenarist: self scenarist;
			fullRun ]
]

{ #category : #'ston persistence' }
LGComposedEntry >> stonOn: stonWriter [
	stonWriter
		writeObject: self streamList: [ :list |
			self entries do: [ :e | list add: e ] ]
]
