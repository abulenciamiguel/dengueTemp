process dengue {
	cpus 8
	container 'ufuomababatunde/denguer:v1.5.0'

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
    dengue-download-ref.py

	dengue-ngs.py \
    -j 1 \
    -t 4 \
    -k ${krakenDB} \
    --platform illumina \
    -f ${inputDirectory}
	"""

}
