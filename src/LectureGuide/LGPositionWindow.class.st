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

{ #category : #'instance creation' }
LGPositionWindow class >> fromSton: stonReader [
	"To materialize an instance of mine, the string stored at #newPosition key is evaluated (because it might be a block closure).
	 During the evaluation, 'self' symbol is bound to the new instance of mine in which the result of the evaluation will be stored."
	
	| parseMap instance |
	parseMap := stonReader parseMap.
	self assert: parseMap size = 2.
	
	instance := self new.
	
	^ instance
		newPosition: (self compiler
							bindings: { #self -> instance } asDictionary;
							evaluate: (parseMap at: #newPosition));
		windowSelector: (parseMap at: #windowSelector);
		yourself
]

{ #category : #'ston-core' }
LGPositionWindow class >> stonAllInstVarNames [
	^ super stonAllInstVarNames \ #(#oldPosition)
]

{ #category : #running }
LGPositionWindow >> basicRevert [
	self window position: oldPosition.
	oldPosition := nil.
	super basicRevert.
]

{ #category : #running }
LGPositionWindow >> basicRun [
	super basicRun.
	oldPosition := self window position.
	self window position: self newPosition
]

{ #category : #'symbolic positions' }
LGPositionWindow >> center [
	self newPosition: [ (self scenarist displayExtent / 2) - (self window extent / 2) ]
]

{ #category : #'symbolic positions' }
LGPositionWindow >> downLeft [
	self newPosition: [ self scenarist displayDownLeftCornerPosition - (0 @ self window extent y) ]
]

{ #category : #'symbolic positions' }
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

{ #category : #accessing }
LGPositionWindow >> oldPosition [
	^ oldPosition
]

{ #category : #printing }
LGPositionWindow >> printTextualRepresentationOn: aStream [
	aStream nextPutAll: 'Center window'
]

{ #category : #'ston persistence' }
LGPositionWindow >> stonOn: stonWriter [
	"We serialize the object held by #newPosition inst. var. as a String.
	 If it is a block, it must only reference 'self' as variable defined outside of it context (which will be bound to the instance of this entry created during materialization)"
	stonWriter writeObject: self streamMap: [ :dictionary |
		dictionary
			at: #newPosition put: newPosition asString;
			at: #windowSelector put: windowSelector ]
]

{ #category : #'symbolic positions' }
LGPositionWindow >> topLeft [
	self newPosition: [ self scenarist displayTopLeftCornerPosition ]
]

{ #category : #'symbolic positions' }
LGPositionWindow >> topRight [
	self newPosition: [ self scenarist displayTopRightCornerPosition - (self window extent x @ 0) ]
]
