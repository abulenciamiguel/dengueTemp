process dengue {
	cpus 8
	container 'ufuomababatunde/denguertest:v1'

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
    -t 16 \
    --read1_suffix _S6_L001_R1_001.fastq.gz \
    --read2_suffix _S6_L001_R2_001.fastq.gz \
    --platform illumina \
    -f ${inputDirectory}
	"""

}
