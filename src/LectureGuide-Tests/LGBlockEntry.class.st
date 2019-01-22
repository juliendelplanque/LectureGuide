Class {
	#name : #LGBlockEntry,
	#superclass : #LGEntry,
	#instVars : [
		'runBlock',
		'revertBlock'
	],
	#category : #'LectureGuide-Tests'
}

{ #category : #running }
LGBlockEntry >> revert [
	self revertBlock value
]

{ #category : #accessing }
LGBlockEntry >> revertBlock [
	^ revertBlock
]

{ #category : #accessing }
LGBlockEntry >> revertBlock: anObject [
	revertBlock := anObject
]

{ #category : #running }
LGBlockEntry >> run [
	self runBlock value
]

{ #category : #accessing }
LGBlockEntry >> runBlock [
	^ runBlock
]

{ #category : #accessing }
LGBlockEntry >> runBlock: anObject [
	runBlock := anObject
]
