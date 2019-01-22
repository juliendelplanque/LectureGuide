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

{ #category : #running }
LGCreateClass >> revert [
	(self class environment at: self name) removeFromSystem
]

{ #category : #running }
LGCreateClass >> run [
	(self class environment at: self superClass)
		subclass: self name
		slots: self slots
		classVariables: self classVariables
		package: self package
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
