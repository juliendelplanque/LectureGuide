Class {
	#name : #LGShowMethod,
	#superclass : #LGShowClass,
	#instVars : [
		'methodSelectorToShow'
	],
	#category : #'LectureGuide-Entries'
}

{ #category : #'instance creation' }
LGShowMethod class >> class: aSymbol methodSelectorToShow: selector [
	^ (self classToShow: aSymbol)
			methodSelectorToShow: selector;
			yourself
]

{ #category : #accessing }
LGShowMethod >> methodSelectorToShow [
	^ methodSelectorToShow
]

{ #category : #accessing }
LGShowMethod >> methodSelectorToShow: anObject [
	methodSelectorToShow := anObject
]

{ #category : #running }
LGShowMethod >> run [
	self scenarist
		showMethod:
			(self class environment at: self classToShow)
				>> self methodSelectorToShow
]
