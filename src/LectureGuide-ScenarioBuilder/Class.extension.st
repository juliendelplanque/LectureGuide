Extension { #name : #Class }

{ #category : #'*LectureGuide-ScenarioBuilder' }
Class >> asLGCreateClass [
	^ LGCreateClass new
		superClass: self superclass name;
		name: self name;
		slots: self slots;
		classVariables: (self classVariables collect: #name);
		package: self package name
]
