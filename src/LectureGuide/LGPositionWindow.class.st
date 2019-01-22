Class {
	#name : #LGPositionWindow,
	#superclass : #LGEntry,
	#instVars : [
		'newPosition',
		'oldPosition',
		'windowSelector'
	],
	#category : #'LectureGuide-Entries'
}

{ #category : #'instance creation' }
LGPositionWindow class >> windowSelector: aSymbol [
	^ self new
		windowSelector: aSymbol;
		yourself
]

{ #category : #running }
LGPositionWindow >> basicRevert [
	self window position: oldPosition.
	oldPosition := nil
]

{ #category : #running }
LGPositionWindow >> basicRun [
	oldPosition := self window position.
	self window center: self newPosition
]

{ #category : #accessing }
LGPositionWindow >> center [
	self newPosition: [ self scenarist displayExtent / 2 ]
]

{ #category : #accessing }
LGPositionWindow >> newPosition [
	^ newPosition value
]

{ #category : #accessing }
LGPositionWindow >> newPosition: anObject [
	newPosition := anObject
]

{ #category : #printing }
LGPositionWindow >> printTextualRepresentationOn: aStream [
	aStream nextPutAll: 'Center window'
]

{ #category : #accessing }
LGPositionWindow >> topLeft [
	self newPosition: [ self window extent / 2 ]
]

{ #category : #running }
LGPositionWindow >> window [
	^ self windowSelector value: self scenarist
]

{ #category : #accessing }
LGPositionWindow >> windowSelector [
	^ windowSelector
]

{ #category : #accessing }
LGPositionWindow >> windowSelector: aSymbol [
	windowSelector := aSymbol
]
