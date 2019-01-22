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
	oldExtent := nil
]

{ #category : #running }
LGResizeWindow >> basicRun [
	oldExtent := self window extent.
	self window extent: self newExtent
]

{ #category : #accessing }
LGResizeWindow >> newExtent [
	^ newExtent value
]

{ #category : #accessing }
LGResizeWindow >> newExtent: anObject [
	newExtent := anObject
]

{ #category : #'symbolic extents' }
LGResizeWindow >> quarterOfDisplay [
	self newExtent: [ self scenarist displayExtent / 2 ]
]
