Class {
	#name : #BaselineOfGtoolkitCiExperiment,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtoolkitCiExperiment
}

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
