Class {
	#name : #LGCreateClassTest,
	#superclass : #TestCase,
	#instVars : [
		'entry'
	],
	#category : #'LectureGuide-Tests'
}

{ #category : #accessing }
LGCreateClassTest >> classVariablesForGeneratedClass [
	^ #(#ClassVar1)
]

{ #category : #accessing }
LGCreateClassTest >> nameForGeneratedClass [
	^ #ClassGeneratedForLGCreateClassTest
]

{ #category : #accessing }
LGCreateClassTest >> packageForGeneratedClass [
	^ self class package name
]

{ #category : #running }
LGCreateClassTest >> setUp [
	super setUp.
	entry := LGCreateClass new
		package: self packageForGeneratedClass;
		name: self nameForGeneratedClass;
		slots: self slotsForGeneratedClass;
		classVariables: self classVariablesForGeneratedClass;
		superClass: self superclassForGeneratedClass;
		yourself
]

{ #category : #accessing }
LGCreateClassTest >> slotsForGeneratedClass [
	^ #(#instVar1 #instVar2)
]

{ #category : #accessing }
LGCreateClassTest >> superclassForGeneratedClass [
	^ #Object
]

{ #category : #running }
LGCreateClassTest >> tearDown [
	(self class package classes anySatisfy: [ :c | c name = #ClassGeneratedForLGCreateClassTest ])
		ifTrue: [ entry basicRevert ].
	
	super tearDown
]

{ #category : #tests }
LGCreateClassTest >> testBasicRevert [
	self
		assert: (self class package classes noneSatisfy: [ :c | c name = self nameForGeneratedClass ])
		description: 'The class #ClassGeneratedForLGCreateClassTest should not already exist.'.
		
	entry basicRun.
	
	entry basicRevert.
	
	self
		assert: (self class package classes noneSatisfy: [ :c | c name = self nameForGeneratedClass ])
		description: 'The class #ClassGeneratedForLGCreateClassTest should not exist anymore.'.
]

{ #category : #tests }
LGCreateClassTest >> testBasicRun [
	| classCreated |
	self
		assert: (self class package classes noneSatisfy: [ :c | c name = self nameForGeneratedClass ])
		description: 'The class #ClassGeneratedForLGCreateClassTest should not already exist.'.
		
	entry basicRun.
	
	classCreated := self class package classes detect: [ :c | c name = self nameForGeneratedClass ].
	self assert: classCreated name equals: self nameForGeneratedClass.
	self assert: classCreated superclass name equals: self superclassForGeneratedClass.
	self assert: (classCreated slots collect: #name) equals: self slotsForGeneratedClass.
	self assert: (classCreated classVariables collect: #name) equals: self classVariablesForGeneratedClass.
	self assert: (classCreated package name) equals: self packageForGeneratedClass.
]
