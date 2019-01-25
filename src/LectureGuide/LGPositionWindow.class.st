"
I am an entry describing the intent to position a window.

The new position of the window is stored in #newPosition slot.
"
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
	self window position: self newPosition
]

{ #category : #'symbolic positions' }
LGPositionWindow >> center [
	self newPosition: [ (self scenarist displayExtent / 2) - (self window extent / 2) ]
]

{ #category : #composition }
LGPositionWindow >> downLeft [
	self newPosition: [ self scenarist displayDownLeftCornerPosition - (0 @ self window extent y) ]
]

{ #category : #composition }
LGPositionWindow >> downRight [
	self newPosition: [ self scenarist displayDownRightCornerPosition - self window extent]
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

{ #category : #composition }
LGPositionWindow >> topLeft [
	self newPosition: [ self scenarist displayTopLeftCornerPosition ]
]

{ #category : #composition }
LGPositionWindow >> topRight [
	self newPosition: [ self scenarist displayTopRightCornerPosition - (self window extent x @ 0) ]
]
