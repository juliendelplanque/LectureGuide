Class {
	#name : #LGEntry,
	#superclass : #Object,
	#instVars : [
		'scenarist'
	],
	#category : #'LectureGuide-Entries'
}

{ #category : #'ston-core' }
LGEntry class >> stonAllInstVarNames [
	^ self allInstVarNames \ #(#scenarist)
]

{ #category : #arithmetic }
LGEntry >> + aLGEntry [
	^ LGComposedEntry new
		entries: { self . aLGEntry } asOrderedCollection;
		yourself
]

{ #category : #running }
LGEntry >> fullRevert [
	"Do not override, this method is called by the scenarist."
	| textualRepresentation |
	textualRepresentation := self textualRepresentation.
	textualRepresentation ifNotEmpty: [ 
		LGNotification signal: 'Revert: ' , textualRepresentation ].
	
	self revert
]

{ #category : #running }
LGEntry >> fullRun [
	"Do not override, this method is called by the scenarist."
	| textualRepresentation |
	textualRepresentation := self textualRepresentation.
	textualRepresentation ifNotEmpty: [
		LGNotification signal: 'Run: ' , textualRepresentation ].
	
	self run
]

{ #category : #printing }
LGEntry >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	self printTextualRepresentationOn: aStream.
	aStream nextPut: $)
]

{ #category : #printing }
LGEntry >> printTextualRepresentationOn: aStream [
	"Subclasses should implement this method to generate a textual representation of the entry."
]

{ #category : #running }
LGEntry >> revert [
	"Actions to do in order to undo an entry that has been run."
]

{ #category : #running }
LGEntry >> run [
	"Actions to do when the entry is run."
]

{ #category : #accessing }
LGEntry >> scenarist [
	^ scenarist
]

{ #category : #accessing }
LGEntry >> scenarist: anObject [
	scenarist := anObject
]

{ #category : #accessing }
LGEntry >> textualRepresentation [
	^ String streamContents: [ :s |
		self printTextualRepresentationOn: s ]
]
