process dengue {
	cpus 8
	container 'quay.io/biocontainers/fastp:0.20.1--h8b12597_0'

	tag "Werk werk werk werk werk"

	
	publishDir (
	path: "${params.outputDir}/01_result/",
	mode: 'copy',
	overwrite: 'true'
	)

	//errorStrategy 'ignore'
	
	input:
	path(inputDirectory)
    path(krakenDB)

	output:
	path("*")


	script:
	"""
	dengue-ngs.py \
    -f ${inputDirectory} \
    -k ${krakenDB} \
    --platform illumina
	"""

}
