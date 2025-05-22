#!/bin/bash -e

# More Information: https://slurm.schedmd.com/sbatch.html
#SBATCH --job-name=scDAPP
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=50G
#SBATCH --output=slurm_scDAPP_%j.log
#SBATCH --time=02-00:00:00       # Run time (dd-hh:mm:ss)
#SBATCH --mail-type=END,FAIL     # Mail events: NONE, BEGIN, END, FAIL, ALL

module purge

export OUTDIR="${SCRATCH}/scDAPP.badas"
export DATASET="/scratch/work/cgsb/badas/scDAPP/scDAPP_example_data/TestCovidDataset"
export SIF="/scratch/work/cgsb/badas/scDAPP/scDAPP.sif"

mkdir -p ${OUTDIR}

${SIF} Rscript --vanilla -e "
#can use this to easily run pipeline to current directory
projdir = Sys.getenv('DATASET')

#Run pipeline with options
scDAPP::scRNAseq_pipeline_runner(
  datadir = paste0(projdir, '/datadir/'),
  outdir = paste0(Sys.getenv('OUTDIR'), '/outs/TESTRUN/'),
  sample_metadata = paste0(projdir, '/sample_metadata.csv'),
  comps = paste0(projdir, '/comps.csv'),
  Pseudobulk_mode = T, #set to F if no replicates

  use_labeltransfer = T,
  refdatapath = paste0(projdir, '/labeltransferref/LabelTransferRef_SCTnormalized.rds'),
  m_reference = paste0(projdir, '/labeltransferref/LabelTransferRefMarkers.rds'),

  species = 'Homo sapiens',

  workernum = 4,
  input_seurat_obj = T #set to F for cellranger input
)
"

printf '\n\n\nAll Done!!!\n\n\n'

echo $SLURM_JOB_NAME
echo $SLURM_JOB_ID
