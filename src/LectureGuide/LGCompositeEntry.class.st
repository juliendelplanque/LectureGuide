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
	self assert: ({ LGResizeWindow } includes: self entries last class).
	
	^ self + (LGPositionWindow windowSelector: self entries last windowSelector) center
]

{ #category : #composing }
LGCompositeEntry >> downLeft [
	self assert: ({ LGResizeWindow } includes: self entries last class).
	
	^ self + (LGPositionWindow windowSelector: self entries last windowSelector) downLeft
]

{ #category : #composing }
LGCompositeEntry >> downRight [
	self assert: ({ LGResizeWindow } includes: self entries last class).
	
	^ self + (LGPositionWindow windowSelector: self entries last windowSelector) downRight
]

{ #category : #accessing }
LGCompositeEntry >> entries [
	^ entries
]

{ #category : #accessing }
LGCompositeEntry >> entries: anObject [
	entries := anObject
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
	self assert: ({ LGResizeWindow } includes: self entries last class).
	
	^ self + (LGPositionWindow windowSelector: self entries last windowSelector) topLeft
]

{ #category : #composing }
LGCompositeEntry >> topRight [
	self assert: ({ LGResizeWindow } includes: self entries last class).
	
	^ self + (LGPositionWindow windowSelector: self entries last windowSelector) topRight
]
