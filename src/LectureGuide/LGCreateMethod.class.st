Class {
	#name : #LGCreateMethod,
	#superclass : #LGEntry,
	#instVars : [
		'targetClassName',
		'sourceCode'
	],
	#category : #'LectureGuide-Entries'
}

{ #category : #running }
LGCreateMethod >> revert [
	((self class environment at: self targetClassName) >> self selectorOfMethodCreated) removeFromSystem
]

{ #category : #running }
LGCreateMethod >> run [
	(self class environment at: self targetClassName) compile: self sourceCode
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
	^ self + (LGShowMethod class: self targetClassName methodSelectorToShow: self selectorOfMethodCreated)
]
