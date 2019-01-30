"
I am here to provide syntax sugar to users of the DSL.

See my class side.
"
Class {
	#name : #Create,
	#superclass : #Object,
	#category : #'LectureGuide-SyntaxSugar'
}

{ #category : #'instance creation' }
Create class >> packageNamed: aString [
	^ LGCreatePackage named: aString
]
