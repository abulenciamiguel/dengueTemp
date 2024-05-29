process dengue {
	cpus 8
	container 'ufuomababatunde/dengue-slim:v1.0.0'

	tag "Werk werk werk werk werk"

	
	publishDir (
	path: "${params.outputDir}/01_result/",
	mode: 'copy',
	overwrite: 'true'
	)

	//errorStrategy 'ignore'
	
	input:
	path(inputDirectory)

	output:
	path("/*")


	script:
	"""
	dengue-ngs.py \
    --jobs 1 \
    --threads 4 \
    --folder ${inputDirectory}
	"""

}
