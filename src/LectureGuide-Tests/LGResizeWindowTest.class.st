Class {
	#name : #LGResizeWindowTest,
	#superclass : #TestCase,
	#instVars : [
		'scenarist',
		'extentSet',
		'entry'
	],
	#category : #'LectureGuide-Tests'
}

{ #category : #running }
LGResizeWindowTest >> setUp [
	| window |
	super setUp.
	scenarist := LGScenarist new.
	
	scenarist stub
		displayExtent willReturn: 20@10.
		
	scenarist stub
		displayTopLeftCornerPosition willReturn: 0@0.
		
	window := Mock new.
	
	window stub
		extent willReturn: 2@2.
		
	(window stub extent: (Instance of: Point)) will: [ :newExtent | extentSet := newExtent ].
		
	scenarist stub
		browserWindow willReturn: window.
		
	entry := (LGResizeWindow windowSelector: #browserWindow)
					scenarist: scenarist;
					yourself.
]

{ #category : #tests }
LGResizeWindowTest >> testDownLeft [
	| composed |
	composed := entry downLeft.
	
	self assert: composed class equals: LGCompositeEntry.
	self assert: composed entries size equals: 2.
	self assert: composed entries first equals: entry.
	self assert: composed entries second class equals: LGPositionWindow.
	self assert: composed entries second windowSelector equals: entry windowSelector.
]

{ #category : #tests }
LGResizeWindowTest >> testDownRight [
	| composed |
	composed := entry downRight.
	
	self assert: composed class equals: LGCompositeEntry.
	self assert: composed entries size equals: 2.
	self assert: composed entries first equals: entry.
	self assert: composed entries second class equals: LGPositionWindow.
	self assert: composed entries second windowSelector equals: entry windowSelector.
]

{ #category : #tests }
LGResizeWindowTest >> testHalfOfDisplayHeight [
	self assert: extentSet isNil.
	self assert: entry oldExtent isNil.
	
	entry
		halfOfDisplayHeight;
		basicRun.
	
	self assert: extentSet equals: (20)@(10/2).
	self assert: entry oldExtent equals: 2@2.
	
	entry basicRevert.
	
	self assert: entry oldExtent isNil.
	self assert: extentSet equals: 2@2.
]

{ #category : #tests }
LGResizeWindowTest >> testHalfOfDisplayWidth [
	self assert: extentSet isNil.
	self assert: entry oldExtent isNil.
	
	entry
		halfOfDisplayWidth;
		basicRun.
	
	self assert: extentSet equals: (20/2)@10.
	self assert: entry oldExtent equals: 2@2.
	
	entry basicRevert.
	
	self assert: entry oldExtent isNil.
	self assert: extentSet equals: 2@2.
]

{ #category : #tests }
LGResizeWindowTest >> testQuarterOfDisplay [
	self assert: extentSet isNil.
	self assert: entry oldExtent isNil.
	
	entry
		quarterOfDisplay;
		basicRun.
	
	self assert: extentSet equals: (20/2)@(10/2).
	self assert: entry oldExtent equals: 2@2.
	
	entry basicRevert.
	
	self assert: entry oldExtent isNil.
	self assert: extentSet equals: 2@2.
]

{ #category : #tests }
LGResizeWindowTest >> testTopLeft [
	| composed |
	composed := entry topLeft.
	
	self assert: composed class equals: LGCompositeEntry.
	self assert: composed entries size equals: 2.
	self assert: composed entries first equals: entry.
	self assert: composed entries second class equals: LGPositionWindow.
	self assert: composed entries second windowSelector equals: entry windowSelector.
]

{ #category : #tests }
LGResizeWindowTest >> testTopRight [
	| composed |
	composed := entry topRight.
	
	self assert: composed class equals: LGCompositeEntry.
	self assert: composed entries size equals: 2.
	self assert: composed entries first equals: entry.
	self assert: composed entries second class equals: LGPositionWindow.
	self assert: composed entries second windowSelector equals: entry windowSelector.
]
