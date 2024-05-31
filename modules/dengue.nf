process dengue {
	cpus 8
	container 'ufuomababatunde/denguer:v0.0.1'

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
    --read1_suffix _S[0-9]+_L001_R1_001.fastq.gz \
    --read2_suffix _S[0-9]+_L001_R2_001.fastq.gz \
    --platform illumina \
    -f ${inputDirectory}
	"""

}
