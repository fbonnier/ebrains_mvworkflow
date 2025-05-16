# Runnning workflow step by step
# Steps are definitely independent and not included in an entire workflow

MODEL_ID=$1


# Download Metadata
cwltool --provenance /media/fbonnier/DATA/TEST/model-verification/${MODEL_ID}/metadata/provenance/ --outdir /media/fbonnier/DATA/TEST/model-verification/${MODEL_ID}/metadata/outputs /home/fbonnier/Documents/sandbox/model_verification_workdir/ebrains_mvworkflow/download_metadata.cwl /media/fbonnier/DATA/TEST/model-verification/${MODEL_ID}/metadata/inputs/input.yml

# Download Data
cwltool --provenance /media/fbonnier/DATA/TEST/model-verification/${MODEL_ID}/data/provenance/ --outdir /media/fbonnier/DATA/TEST/model-verification/${MODEL_ID}/data/outputs /home/fbonnier/Documents/sandbox/model_verification_workdir/ebrains_mvworkflow/download_data.cwl /media/fbonnier/DATA/TEST/model-verification/${MODEL_ID}/data/inputs/input.yml