Class {
	#name : #BaselineOfLectureGuide,
	#superclass : #BaselineOf,
	#category : #BaselineOfLectureGuide
}

{ #category : #baselines }
BaselineOfLectureGuide >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfLectureGuide >> defineDependencies: spec [
	spec
    	baseline: 'Mocketry'
    	with: [ spec repository: 'github://dionisiydk/Mocketry:v4.0.x' ]
]

{ #category : #baselines }
BaselineOfLectureGuide >> defineGroups: spec [
	spec group: 'default' with: #('LectureGuide');
	group: 'builder' with: #('LectureGuide-ScenarioBuilder');
	group: 'spec' with: #('LectureGuide-Spec');
	group: 'tests' with: #('LectureGuide-Tests');
	group: 'all' with: #('default' 'builder' 'spec' 'tests')
]

{ #category : #baselines }
BaselineOfLectureGuide >> definePackages: spec [
	spec
		package: 'LectureGuide';
		package: 'LectureGuide-ScenarioBuilder' with: [ spec requires: #('LectureGuide') ];
		package: 'LectureGuide-Spec' with: [ spec requires: #('LectureGuide') ];
		package: 'LectureGuide-Tests'  with: [ spec requires: #('LectureGuide' 'Mocketry') ]
]
