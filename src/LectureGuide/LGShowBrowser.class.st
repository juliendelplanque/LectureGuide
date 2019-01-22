Class {
	#name : #LGShowBrowser,
	#superclass : #LGEntry,
	#category : #'LectureGuide-Entries'
}

{ #category : #running }
LGShowBrowser >> basicRevert [
	self scenarist hideBrowser
]

{ #category : #running }
LGShowBrowser >> basicRun [
	self scenarist showBrowser
]

{ #category : #printing }
LGShowBrowser >> printTextualRepresentationOn: aStream [
	aStream
		nextPutAll: 'Show browser'
]
