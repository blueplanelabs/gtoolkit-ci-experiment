Class {
	#name : #BaselineOfGtoolkitLepiterCI,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtoolkitLepiterCI
}

{ #category : #accessing }
BaselineOfGtoolkitLepiterCI class >> loadKnowledge [
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
BaselineOfGtoolkitLepiterCI >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'GtoolkitLepiterCI';
				 package: 'GtoolkitLepiterCI-Tests'.
			spec 
			    group: 'Core' with: #('GtoolkitLepiterCI');
			    group: 'Tests' with: #('GtoolkitLepiterCI-Tests');
			    group: 'default' with: #('Core' 'Tests') ]
		
]
