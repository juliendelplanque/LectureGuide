Class {
	#name : #LGBrowserInteractionEntry,
	#superclass : #LGEntry,
	#instVars : [
		'oldBrowerState'
	],
	#category : #'LectureGuide-Entries'
}

{ #category : #running }
LGBrowserInteractionEntry >> basicRevert [
	self scenarist browserState: oldBrowerState.
	oldBrowerState := nil.
	super basicRevert.
]

{ #category : #running }
LGBrowserInteractionEntry >> basicRun [
	oldBrowerState := self scenarist browserState.
]
