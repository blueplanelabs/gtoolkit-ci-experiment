Transcript show: 'Loading knowledge database...'; cr.

IceRepository registry
		detect: [ :aRepository |
			aRepository name = 'gtoolkit-ci-experiment' ]
        ifFound: [ :aRepository |
			| defaultDatabase currentProperties propertiesFile |
			Transcript show: 'path ->', (aRepository repositoryDirectory / 'lepiter') asString; cr.
            defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
            propertiesFile := currentProperties localFile.
            Transcript show: 'DefaultDatabase properties: ', propertiesFile path asString, 'exists?:', propertiesFile asFileReference exists asString, 'writable?:', propertiesFile asFileReference isWritable asString; cr.
            Transcript show: 'Exists ', (aRepository repositoryDirectory / 'pharo-local' / 'lepiter' / 'logical-database.properties') asFileReference exists asString; cr. ]
        ifNone: [
			Transcript show: 'Repository gtoolkit-ci-experiment not found.'; cr. ].


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
