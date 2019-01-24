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
