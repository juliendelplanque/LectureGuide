Class {
	#name : #LGBrowserState,
	#superclass : #Object,
	#instVars : [
		'selectedPackage',
		'selectedClass',
		'selectedMethod'
	],
	#category : #'LectureGuide-Core'
}

{ #category : #accessing }
LGBrowserState >> selectedClass [
	^ selectedClass
]

{ #category : #accessing }
LGBrowserState >> selectedClass: anObject [
	selectedClass := anObject
]

{ #category : #accessing }
LGBrowserState >> selectedMethod [
	^ selectedMethod
]

{ #category : #accessing }
LGBrowserState >> selectedMethod: anObject [
	selectedMethod := anObject
]

{ #category : #accessing }
LGBrowserState >> selectedPackage [
	^ selectedPackage
]

{ #category : #accessing }
LGBrowserState >> selectedPackage: anObject [
	selectedPackage := anObject
]
