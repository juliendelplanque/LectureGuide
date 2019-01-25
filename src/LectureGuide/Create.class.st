Class {
	#name : #Create,
	#superclass : #Object,
	#category : #'LectureGuide-SyntaxSugar'
}

{ #category : #'instance creation' }
Create class >> packageNamed: aString [
	^ LGCreatePackage named: aString
]
