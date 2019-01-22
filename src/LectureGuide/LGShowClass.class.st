Class {
	#name : #LGShowClass,
	#superclass : #LGEntry,
	#instVars : [
		'browser',
		'classToShow'
	],
	#category : #'LectureGuide-Core'
}

{ #category : #'instance creation' }
LGShowClass class >> classToShow: aSymbol [
	^ self new
		classToShow: aSymbol;
		yourself
]

{ #category : #accessing }
LGShowClass >> classToShow [
	^ classToShow
]

{ #category : #accessing }
LGShowClass >> classToShow: anObject [
	classToShow := anObject
]

{ #category : #running }
LGShowClass >> run [
	self scenarist showClass: (self class environment at: self classToShow)
]
