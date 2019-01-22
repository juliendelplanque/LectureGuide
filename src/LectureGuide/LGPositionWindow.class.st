Class {
	#name : #LGPositionWindow,
	#superclass : #LGWindowEntry,
	#instVars : [
		'newPosition',
		'oldPosition'
	],
	#category : #'LectureGuide-Entries'
}

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

{ #category : #'symbolic positions' }
LGPositionWindow >> center [
	self newPosition: [ self scenarist displayExtent / 2 ]
]

{ #category : #accessing }
LGPositionWindow >> downLeft [
	self newPosition: [ (self window extent / 2) + (0 @ self scenarist displayExtent y / 2)]
]

{ #category : #accessing }
LGPositionWindow >> downRight [
	self newPosition: [ (self window extent / 2) + ((self scenarist displayExtent x) @ self scenarist displayExtent y / 2)]
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

{ #category : #accessing }
LGPositionWindow >> topRight [
	self newPosition: [ (self window extent / 2) + (self scenarist displayExtent x / 2 @ 0)]
]
