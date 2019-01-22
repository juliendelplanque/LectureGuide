Class {
	#name : #LGShowBrowser,
	#superclass : #LGEntry,
	#category : #'LectureGuide-Entries'
}

{ #category : #printing }
LGShowBrowser >> printTextualRepresentationOn: aStream [
	aStream
		nextPutAll: 'Show browser'
]

{ #category : #running }
LGShowBrowser >> revert [
	self scenarist browserWindow hide
]

{ #category : #running }
LGShowBrowser >> run [
	self scenarist browserWindow show
]
