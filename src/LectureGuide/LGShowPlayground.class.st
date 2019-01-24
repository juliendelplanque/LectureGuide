Class {
	#name : #LGShowPlayground,
	#superclass : #LGShowWindowEntry,
	#category : #'LectureGuide-Entries'
}

{ #category : #composition }
LGShowPlayground class >> halfOfDisplayHeight [
	^ self new halfOfDisplayHeight
]

{ #category : #composition }
LGShowPlayground class >> halfOfDisplayWidth [
	^ self new halfOfDisplayWidth
]

{ #category : #composition }
LGShowPlayground class >> quarterOfDisplay [
	^ self new quarterOfDisplay
]

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
