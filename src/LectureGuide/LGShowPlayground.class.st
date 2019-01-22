Class {
	#name : #LGShowPlayground,
	#superclass : #LGEntry,
	#category : #'LectureGuide-Entries'
}

{ #category : #composition }
LGShowPlayground class >> thenSetContent: aString [
	^ self new thenSetContent: aString
]

{ #category : #running }
LGShowPlayground >> basicRevert [
	self scenarist playgroundWindow hide
]

{ #category : #running }
LGShowPlayground >> basicRun [
	self scenarist playgroundWindow show
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
