Class {
	#name : #LGCreateMethod,
	#superclass : #LGEntry,
	#instVars : [
		'targetClassName',
		'protocol',
		'sourceCode',
		'isClassSide'
	],
	#category : #'LectureGuide-Entries'
}

{ #category : #running }
LGCreateMethod >> basicRevert [
	| target |
	target := self class environment at: self targetClassName.
	self isClassSide
		ifTrue: [ target := target class ].
	(target >> self selectorOfMethodCreated) removeFromSystem
]

{ #category : #running }
LGCreateMethod >> basicRun [
	| target |
	target := self class environment at: self targetClassName.
	self isClassSide
		ifTrue: [ target := target class ].
	(target compile: self sourceCode)
		protocol: self protocol
]

{ #category : #initialization }
LGCreateMethod >> initialize [
	super initialize.
	self isClassSide: false.
	self protocol: 'as yet unclassified'
]

{ #category : #accessing }
LGCreateMethod >> isClassSide [
	^ isClassSide
]

{ #category : #accessing }
LGCreateMethod >> isClassSide: anObject [
	isClassSide := anObject
]

{ #category : #printing }
LGCreateMethod >> printTextualRepresentationOn: aStream [
	aStream
		nextPutAll: 'Create method "';
		nextPutAll: self targetClassName;
		nextPutAll: '>>';
		nextPutAll: self selectorOfMethodCreated;
		nextPut: $"
]

{ #category : #accessing }
LGCreateMethod >> protocol [
	^ protocol
]

{ #category : #accessing }
LGCreateMethod >> protocol: anObject [
	protocol := anObject
]

{ #category : #running }
LGCreateMethod >> selectorOfMethodCreated [
	^ (Smalltalk compiler compile: self sourceCode) selector
]

{ #category : #accessing }
LGCreateMethod >> sourceCode [
	^ sourceCode
]

{ #category : #accessing }
LGCreateMethod >> sourceCode: anObject [
	sourceCode := anObject
]

{ #category : #accessing }
LGCreateMethod >> targetClassName [
	^ targetClassName
]

{ #category : #accessing }
LGCreateMethod >> targetClassName: anObject [
	targetClassName := anObject
]

{ #category : #composition }
LGCreateMethod >> thenShowIt [
	"Returns a new composed operator that execute myself and then show the class created."
	^ self
		+ ((LGShowMethod class: self targetClassName methodSelectorToShow: self selectorOfMethodCreated)
			isClassSide: self isClassSide;
			yourself)
]
