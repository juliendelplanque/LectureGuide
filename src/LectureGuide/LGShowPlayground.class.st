"
I am an entry describing the intent to show the playground.
"
Class {
	#name : #LGShowPlayground,
	#superclass : #LGShowWindowEntry,
	#category : #'LectureGuide-Entries'
}

{ #category : #composition }
LGShowPlayground class >> thenSetContent: aString [
	^ self new thenSetContent: aString
]

{ #category : #initialization }
LGShowPlayground >> initialize [
	super initialize.
	self windowSelector: #playgroundWindow.
	self showWindowSelector: #showPlayground.
	self hideWindowSelector: #hidePlayground.
]

{ #category : #printing }
LGShowPlayground >> printTextualRepresentationOn: aStream [
	aStream
		nextPutAll: 'Show playground'
]

{ #category : #composition }
LGShowPlayground >> thenSetContent: aString [
	^ self + (LGSetPlaygroundContent new
								content: aString;
								yourself)
]
