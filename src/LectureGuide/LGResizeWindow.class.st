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

{ #category : #composing }
LGResizeWindow >> topLeft [
	^ self + (LGPositionWindow windowSelector: self windowSelector) topLeft
]

{ #category : #composing }
LGResizeWindow >> topRight [
	^ self + (LGPositionWindow windowSelector: self windowSelector) topRight
]
