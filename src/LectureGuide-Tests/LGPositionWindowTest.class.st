Class {
	#name : #LGPositionWindowTest,
	#superclass : #TestCase,
	#instVars : [
		'scenarist',
		'entry',
		'positionSet'
	],
	#category : #'LectureGuide-Tests'
}

{ #category : #running }
LGPositionWindowTest >> setUp [
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
	
	window stub
		position willReturn: 5@5.
		
	(window stub position: (Instance of: Point)) will: [ :newPosition | positionSet := newPosition ].
		
	scenarist stub
		browserWindow willReturn: window.
		
	entry := (LGPositionWindow windowSelector: #browserWindow)
					scenarist: scenarist;
					yourself.
]

{ #category : #tests }
LGPositionWindowTest >> testCenter [
	self assert: positionSet isNil.
	self assert: entry oldPosition isNil.
	
	entry
		center;
		basicRun.
	
	self assert: positionSet equals: 9@4.
	self assert: entry oldPosition equals: 5@5.
	
	entry basicRevert.
	
	self assert: entry oldPosition isNil.
	self assert: positionSet equals: 5@5.
]

{ #category : #tests }
LGPositionWindowTest >> testDownLeft [
	self assert: positionSet isNil.
	self assert: entry oldPosition isNil.
	
	entry
		downLeft;
		basicRun.
	
	self assert: positionSet equals: 0@8.
	self assert: entry oldPosition equals: 5@5.
	
	entry basicRevert.
	
	self assert: entry oldPosition isNil.
	self assert: positionSet equals: 5@5.
]

{ #category : #tests }
LGPositionWindowTest >> testDownRight [
	self assert: positionSet isNil.
	self assert: entry oldPosition isNil.
	
	entry
		downRight;
		basicRun.
	
	self assert: positionSet equals: 18@8.
	self assert: entry oldPosition equals: 5@5.
	
	entry basicRevert.
	
	self assert: entry oldPosition isNil.
	self assert: positionSet equals: 5@5.
]

{ #category : #tests }
LGPositionWindowTest >> testNewPosition [
	entry newPosition: 1@1.
	
	self assert: entry newPosition equals: 1@1.
	
	entry newPosition: [ (1@1) + (1@1) ].
	
	self assert: entry newPosition equals: 2@2.
]

{ #category : #tests }
LGPositionWindowTest >> testTopLeft [
	self assert: positionSet isNil.
	self assert: entry oldPosition isNil.
	
	entry
		topLeft;
		basicRun.
	
	self assert: positionSet equals: 0@0.
	self assert: entry oldPosition equals: 5@5.
	
	entry basicRevert.
	
	self assert: entry oldPosition isNil.
	self assert: positionSet equals: 5@5.
]

{ #category : #tests }
LGPositionWindowTest >> testTopRight [
	self assert: positionSet isNil.
	self assert: entry oldPosition isNil.
	
	entry
		topRight;
		basicRun.
	
	self assert: positionSet equals: 18@0.
	self assert: entry oldPosition equals: 5@5.
	
	entry basicRevert.
	
	self assert: entry oldPosition isNil.
	self assert: positionSet equals: 5@5.
]
