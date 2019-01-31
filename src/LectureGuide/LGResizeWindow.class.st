"
I am an entry describing the intent to resize a window.

The new extent of the window is stored in #newExtent slot.
"
Class {
	#name : #LGResizeWindow,
	#superclass : #LGWindowEntry,
	#instVars : [
		'newExtent',
		'oldExtent'
	],
	#category : #'LectureGuide-Entries'
}

{ #category : #'instance creation' }
LGResizeWindow class >> fromSton: stonReader [
	"To materialize an instance of mine, the string stored at #newExtent key is evaluated (because it might be a block closure).
	 During the evaluation, 'self' symbol is bound to the new instance of mine in which the result of the evaluation will be stored."
	
	| parseMap |
	parseMap := stonReader parseMap.
	self assert: parseMap size = 2.
	
	^ self new
		newExtentFromBlockString: (parseMap at: #newExtent);
		windowSelector: (parseMap at: #windowSelector);
		yourself
]

{ #category : #'ston-core' }
LGResizeWindow class >> stonAllInstVarNames [
	^ super stonAllInstVarNames \ #(#oldExtent)
]

{ #category : #running }
LGResizeWindow >> basicRevert [
	self window extent: oldExtent.
	oldExtent := nil.
	super basicRevert.
]

{ #category : #running }
LGResizeWindow >> basicRun [
	super basicRun.
	oldExtent := self window extent.
	self window extent: self newExtent
]

{ #category : #composing }
LGResizeWindow >> downLeft [
	^ self + (LGPositionWindow windowSelector: self windowSelector) downLeft
]

{ #category : #composing }
LGResizeWindow >> downRight [
	^ self + (LGPositionWindow windowSelector: self windowSelector) downRight
]

{ #category : #'symbolic extents' }
LGResizeWindow >> halfOfDisplayHeight [
	self newExtent: [ self scenarist displayExtent x @ (self scenarist displayExtent y / 2) ]
]

{ #category : #'symbolic extents' }
LGResizeWindow >> halfOfDisplayWidth [
	self newExtent: [ (self scenarist displayExtent x / 2) @ self scenarist displayExtent y ]
]

{ #category : #accessing }
LGResizeWindow >> newExtent [
	^ newExtent value
]

{ #category : #accessing }
LGResizeWindow >> newExtent: anObject [
	newExtent := anObject
]

{ #category : #'ston persistence' }
LGResizeWindow >> newExtentFromBlockString: aString [
	self newExtent: (self class compiler
								class: self class;
								receiver: self;
								context: thisContext;
								evaluate: aString)
]

{ #category : #accessing }
LGResizeWindow >> oldExtent [
	^ oldExtent
]

{ #category : #printing }
LGResizeWindow >> printTextualRepresentationOn: aStream [
	aStream nextPutAll: 'Resize window'
]

{ #category : #'symbolic extents' }
LGResizeWindow >> quarterOfDisplay [
	self newExtent: [ self scenarist displayExtent / 2 ]
]

{ #category : #'ston persistence' }
LGResizeWindow >> stonOn: stonWriter [	
	"We serialize the object held by #newExtent inst. var. as a String.
	 If it is a block, it must only reference 'self' as variable defined outside of it context (which will be bound to the instance of this entry created during materialization)"
	stonWriter writeObject: self streamMap: [ :dictionary |
		dictionary
			at: #newExtent put: newExtent asString;
			at: #windowSelector put: windowSelector ]
]

{ #category : #composing }
LGResizeWindow >> topLeft [
	^ self + (LGPositionWindow windowSelector: self windowSelector) topLeft
]

{ #category : #composing }
LGResizeWindow >> topRight [
	^ self + (LGPositionWindow windowSelector: self windowSelector) topRight
]
