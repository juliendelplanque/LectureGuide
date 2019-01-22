Class {
	#name : #LGShowMethod,
	#superclass : #LGShowClass,
	#instVars : [
		'methodSelectorToShow',
		'isClassSide'
	],
	#category : #'LectureGuide-Entries'
}

{ #category : #'instance creation' }
LGShowMethod class >> class: aSymbol methodSelectorToShow: selector [
	^ (self classToShow: aSymbol)
			methodSelectorToShow: selector;
			yourself
]

{ #category : #running }
LGShowMethod >> basicRun [
	| target |
	target := self class environment at: self classToShow.
	self isClassSide
		ifTrue: [ target := target class ].
	self scenarist
		showMethod:
			target >> self methodSelectorToShow
]

{ #category : #initialization }
LGShowMethod >> initialize [
	super initialize.
	self isClassSide: false
]

{ #category : #accessing }
LGShowMethod >> isClassSide [
	^ isClassSide
]

{ #category : #accessing }
LGShowMethod >> isClassSide: anObject [
	isClassSide := anObject
]

{ #category : #accessing }
LGShowMethod >> methodSelectorToShow [
	^ methodSelectorToShow
]

{ #category : #accessing }
LGShowMethod >> methodSelectorToShow: anObject [
	methodSelectorToShow := anObject
]

{ #category : #printing }
LGShowMethod >> printTextualRepresentationOn: aStream [
	aStream
		nextPutAll: 'Show method "';
		nextPutAll: self classToShow;
		nextPutAll: '>>';
		nextPutAll: self methodSelectorToShow;
		nextPut: $"
]
