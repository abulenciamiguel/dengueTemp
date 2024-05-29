// enable dsl2
nextflow.enable.dsl=2


// import modules
include {dengue} from './modules/dengue.nf'

workflow {


	Channel
		.fromPath("${params.inputDir}/", type: 'dir')
		.ifEmpty{error "Cannot find any reads"}
		.set{ch_inDir}
		

	main:
		ch_inDir.view()
		dengue(ch_inDir, params.krakenDB)

}



