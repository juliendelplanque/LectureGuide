Class {
	#name : #LGShowBrowserTest,
	#superclass : #TestCase,
	#category : #'LectureGuide-Tests'
}

{ #category : #tests }
LGShowBrowserTest >> testInitialize [
	| entry |
	entry := LGShowBrowser new.
	
	self assert: entry showWindowSelector equals: #showBrowser.
	self assert: entry hideWindowSelector equals: #hideBrowser.
]
