Class {
	#name : #LGCenterBrowser,
	#superclass : #LGEntry,
	#instVars : [
		'oldPosition'
	],
	#category : #'LectureGuide-Entries'
}

{ #category : #printing }
LGCenterBrowser >> printTextualRepresentationOn: aStream [
	aStream nextPutAll: 'Center browser'
]

{ #category : #running }
LGCenterBrowser >> revert [
	self scenarist browserWindow position: oldPosition.
	oldPosition := nil
]

{ #category : #running }
LGCenterBrowser >> run [
	oldPosition := self scenarist browserWindow position.
	self scenarist browserWindow center: World center.
]
