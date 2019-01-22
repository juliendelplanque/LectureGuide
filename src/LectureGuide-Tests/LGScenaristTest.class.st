Class {
	#name : #LGScenaristTest,
	#superclass : #TestCase,
	#instVars : [
		'firstEntryRevertFlag',
		'firstEntryRunFlag',
		'secondEntryRevertFlag',
		'secondEntryRunFlag',
		'thirdEntryRevertFlag',
		'thirdEntryRunFlag',
		'scenario',
		'scenarist'
	],
	#category : #'LectureGuide-Tests'
}

{ #category : #running }
LGScenaristTest >> setUp [
	firstEntryRunFlag := firstEntryRevertFlag := false.
	secondEntryRunFlag := secondEntryRevertFlag := false.
	thirdEntryRunFlag := thirdEntryRevertFlag := false.
	scenario := LGScenario new.
	scenario
		addEntry: (LGBlockEntry new
						runBlock: [ firstEntryRunFlag := true ];
						revertBlock: [ firstEntryRevertFlag := true ];
						yourself);
		addEntry: (LGBlockEntry new
						runBlock: [ secondEntryRunFlag := true ];
						revertBlock: [ secondEntryRevertFlag := true ];
						yourself);
		addEntry: (LGBlockEntry new
						runBlock: [ thirdEntryRunFlag := true ];
						revertBlock: [ thirdEntryRevertFlag := true ];
						yourself).
						
	scenarist := LGScenarist read: scenario.
]

{ #category : #tests }
LGScenaristTest >> testNext [
	self deny: firstEntryRunFlag.
	self deny: firstEntryRevertFlag.
	self deny: secondEntryRunFlag.
	self deny: secondEntryRevertFlag.
	self deny: thirdEntryRunFlag.
	self deny: thirdEntryRevertFlag.
	
	scenarist next.
	
	self assert: firstEntryRunFlag.
	self deny: firstEntryRevertFlag.
	self deny: secondEntryRunFlag.
	self deny: secondEntryRevertFlag.
	self deny: thirdEntryRunFlag.
	self deny: thirdEntryRevertFlag.
	self assert: scenarist forwardStack size equals: scenario size - 1.
	self assert: scenarist backwardStack size equals: 1.
]

{ #category : #tests }
LGScenaristTest >> testPrevious [	
	scenarist next.
	
	self assert: firstEntryRunFlag.
	self deny: firstEntryRevertFlag.
	self deny: secondEntryRunFlag.
	self deny: secondEntryRevertFlag.
	self deny: thirdEntryRunFlag.
	self deny: thirdEntryRevertFlag.
	self assert: scenarist forwardStack size equals: scenario size - 1.
	self assert: scenarist backwardStack size equals: 1.
	
	firstEntryRunFlag := false.
	
	scenarist previous.
	self deny: firstEntryRunFlag.
	self assert:  firstEntryRevertFlag.
	self deny: secondEntryRunFlag.
	self deny: secondEntryRevertFlag.
	self deny: thirdEntryRunFlag.
	self deny: thirdEntryRevertFlag.
	self assert: scenarist forwardStack size equals: scenario size.
	self assert: scenarist backwardStack size equals: 0.
]

{ #category : #tests }
LGScenaristTest >> testRead [
	self assert: scenarist scenario equals: scenario.
	self deny: scenarist hasLastEntryRun isNil.
	self assert: scenarist backwardStack isEmpty.
	self assert: scenarist forwardStack size equals: scenario size.
	self assert: scenarist hasNextEntry
]
