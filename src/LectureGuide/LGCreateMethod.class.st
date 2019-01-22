Class {
	#name : #LGCreateMethod,
	#superclass : #LGEntry,
	#instVars : [
		'targetClassName',
		'sourceCode',
		'selectorOfMethodCreated'
	],
	#category : #'LectureGuide-Core'
}

{ #category : #running }
LGCreateMethod >> revert [
	((self class environment at: self targetClassName) >> selectorOfMethodCreated) removeFromSystem.
	selectorOfMethodCreated := nil
]

{ #category : #running }
LGCreateMethod >> run [
	selectorOfMethodCreated := (self class environment at: self targetClassName)
							compile: self sourceCode
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
