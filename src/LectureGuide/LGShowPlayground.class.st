Class {
	#name : #LGShowPlayground,
	#superclass : #LGEntry,
	#category : #'LectureGuide-Entries'
}

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
