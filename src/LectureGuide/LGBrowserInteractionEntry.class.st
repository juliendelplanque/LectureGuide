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
	self restoreBrowserState.
	super basicRevert
]

{ #category : #running }
LGBrowserInteractionEntry >> basicRun [
	super basicRun.
	self saveBrowserState
]

{ #category : #'browser state' }
LGBrowserInteractionEntry >> restoreBrowserState [
	self scenarist browserState: oldBrowerState.
	oldBrowerState := nil
]

{ #category : #'browser state' }
LGBrowserInteractionEntry >> saveBrowserState [
	oldBrowerState := self scenarist browserState
]
