Class {
	#name : #BaselineOfGtoolkitCiExperiment,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtoolkitCiExperiment
}

{ #category : #accessing }
BaselineOfGtoolkitCiExperiment class >> loadKnowledge [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'gtoolkit-lepiter-ci' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository gtoolkit-ci-experiment not found.' ]
]

{ #category : #baseline }
BaselineOfGtoolkitCiExperiment >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'GtoolkitCiExperiment';
				 package: 'GtoolkitCiExperiment-Tests'.
			spec 
			    group: 'Core' with: #('GtoolkitCiExperiment');
			    group: 'Tests' with: #('GtoolkitCiExperiment-Tests');
			    group: 'default' with: #('Core' 'Tests') ]
		
]
