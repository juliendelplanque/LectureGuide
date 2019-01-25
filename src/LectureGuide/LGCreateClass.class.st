Class {
	#name : #LGCreateClass,
	#superclass : #LGEntry,
	#instVars : [
		'superClass',
		'name',
		'slots',
		'classVariables',
		'package'
	],
	#category : #'LectureGuide-Entries'
}

{ #category : #running }
LGCreateClass >> basicRevert [
	super basicRevert.
	(self class environment at: self name) removeFromSystem
]

{ #category : #running }
LGCreateClass >> basicRun [
	super basicRun.
	(self class environment at: self superClass)
		subclass: self name
		slots: self slots
		classVariables: self classVariables
		package: self package
]

{ #category : #accessing }
LGCreateClass >> classVariables [
	^ classVariables
]

{ #category : #accessing }
LGCreateClass >> classVariables: anObject [
	classVariables := anObject
]

{ #category : #initialization }
LGCreateClass >> initialize [
	super initialize.
	self superClass: #Object.
	self classVariables: #().
	self slots: #()
]

{ #category : #accessing }
LGCreateClass >> name [
	^ name
]

{ #category : #accessing }
LGCreateClass >> name: anObject [
	name := anObject
]

{ #category : #accessing }
LGCreateClass >> package [
	^ package
]

{ #category : #accessing }
LGCreateClass >> package: anObject [
	package := anObject
]

{ #category : #printing }
LGCreateClass >> printTextualRepresentationOn: aStream [
	aStream
		nextPutAll: 'Create class "';
		nextPutAll: self name;
		nextPut: $"
]

{ #category : #accessing }
LGCreateClass >> slots [
	^ slots
]

{ #category : #accessing }
LGCreateClass >> slots: anObject [
	slots := anObject
]

{ #category : #accessing }
LGCreateClass >> superClass [
	^ superClass
]

{ #category : #accessing }
LGCreateClass >> superClass: anObject [
	superClass := anObject
]

{ #category : #composition }
LGCreateClass >> thenShowIt [
	"Returns a new composed operator that execute myself and then show the class created."
	^ self + (LGShowClass classToShow: self name)
]
