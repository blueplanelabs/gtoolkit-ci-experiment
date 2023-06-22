Transcript show: 'Loading knowledge database...'; cr.

IceRepository registry
		detect: [ :aRepository |
			aRepository name = 'gtoolkit-ci-experiment' ]
        ifFound: [ :aRepository |
			| defaultDatabase currentProperties |
			Transcript show: 'path ->', (aRepository repositoryDirectory / 'lepiter') asString.
			 ]
		ifNone: [
			self inform: 'Repository gtoolkit-ci-experiment not found.' ]


BaselineOfGtoolkitCiExperiment loadKnowledge.

databaseNames := LeDatabasesRegistry defaultLogicalDatabase databases collect: #databaseName.

Transcript show: 'Databases: ', databaseNames asString; cr.

Transcript show: 'Applying knowledge snippets...'; cr.

testPage := (LeDatabasesRegistry defaultLogicalDatabase databaseNamed: 'blueplanelabs/gtoolkit-ci-experiment/lepiter') pages first.

Transcript show: 'Found Test Page'; cr.

snippets := testPage allChildrenSnippetsMatching: [ :aSnippet |
    aSnippet isKindOf: LePharoSnippet].

Transcript show: 'Found ', (snippets size) asString , ' Pharo snippets to be applied.'; cr.

snippets do: [ :aSnippet |
    aSnippet coder doItAll ].

Transcript show: 'Exists LepiterDefinedClass? ', (Smalltalk at: #LepiterDefinedClass) isNotNil asString; cr.
