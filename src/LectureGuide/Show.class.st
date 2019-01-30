"
I am here to provide syntax sugar to users of the DSL.

See my class side.
"
Class {
	#name : #Show,
	#superclass : #Object,
	#category : #'LectureGuide-SyntaxSugar'
}

{ #category : #sugar }
Show class >> browser [
	^ LGShowBrowser
]

{ #category : #sugar }
Show class >> commenter [
	^ LGShowCommenter
]

{ #category : #sugar }
Show class >> playground [
	^ LGShowPlayground
]
