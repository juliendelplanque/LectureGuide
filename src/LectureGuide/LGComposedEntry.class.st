Class {
	#name : #LGComposedEntry,
	#superclass : #LGEntry,
	#instVars : [
		'entries'
	],
	#category : #'LectureGuide-Core'
}

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
