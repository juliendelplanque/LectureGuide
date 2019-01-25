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
