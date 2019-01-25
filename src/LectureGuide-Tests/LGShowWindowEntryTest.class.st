Class {
	#name : #LGShowWindowEntryTest,
	#superclass : #TestCase,
	#instVars : [
		'entry'
	],
	#category : #'LectureGuide-Tests'
}

{ #category : #running }
LGShowWindowEntryTest >> setUp [
	super setUp.
	entry := LGShowWindowEntry windowSelector: #browserWindow
]

{ #category : #tests }
LGShowWindowEntryTest >> testHalfOfDisplayHeight [
	| composed |
	composed := entry halfOfDisplayHeight.
	
	self assert: composed class equals: LGCompositeEntry.
	self assert: composed entries size equals: 2.
	self assert: composed entries first equals: entry.
	self assert: composed entries second class equals: LGResizeWindow.
	self assert: composed entries second windowSelector equals: entry windowSelector.
]

{ #category : #tests }
LGShowWindowEntryTest >> testHalfOfDisplayWidth [
	| composed |
	composed := entry halfOfDisplayWidth.
	
	self assert: composed class equals: LGCompositeEntry.
	self assert: composed entries size equals: 2.
	self assert: composed entries first equals: entry.
	self assert: composed entries second class equals: LGResizeWindow.
	self assert: composed entries second windowSelector equals: entry windowSelector.
]

{ #category : #tests }
LGShowWindowEntryTest >> testQuarterOfDisplay [
	| composed |
	composed := entry quarterOfDisplay.
	
	self assert: composed class equals: LGCompositeEntry.
	self assert: composed entries size equals: 2.
	self assert: composed entries first equals: entry.
	self assert: composed entries second class equals: LGResizeWindow.
	self assert: composed entries second windowSelector equals: entry windowSelector.
]
