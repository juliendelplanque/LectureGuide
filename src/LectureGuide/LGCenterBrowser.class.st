Class {
	#name : #LGCenterBrowser,
	#superclass : #LGEntry,
	#instVars : [
		'oldPosition'
	],
	#category : #'LectureGuide-Entries'
}

{ #category : #running }
LGCenterBrowser >> basicRevert [
	self scenarist browserWindow position: oldPosition.
	oldPosition := nil
]

{ #category : #running }
LGCenterBrowser >> basicRun [
	oldPosition := self scenarist browserWindow position.
	self scenarist browserWindow center: World center.
]

{ #category : #printing }
LGCenterBrowser >> printTextualRepresentationOn: aStream [
	aStream nextPutAll: 'Center browser'
]
