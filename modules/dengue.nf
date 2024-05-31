process dengue {
	cpus 8
	container 'ufuomababatunde/denguer:v1.1.0'

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
	path("*")


	script:
	"""
	dengue-ngs.py \
    -j 1 \
    --read1_suffix _S6_L001_R1_001.fastq.gz \
    --read2_suffix _S6_L001_R2_001.fastq.gz \
    -t 16 \
    --platform illumina \
    -f ${inputDirectory}
	"""

}
