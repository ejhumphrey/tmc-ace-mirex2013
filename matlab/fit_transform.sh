#!/bin/bash

FEATURES=tmc_features

# FOLD_IDXS=$(seq 0 4)
FOLD_IDXS="0"
BASEDIR=/Users/ejhumphrey
METADATA=${BASEDIR}/metadata
FEATURE_DIR=${BASEDIR}/${FEATURES}

ESTIMATIONS=${BASEDIR}/estimations/${FEATURES}
MODELS=${BASEDIR}/models/${FEATURES}
for idx in ${FOLD_IDXS}
do
    MODELDIR=${MODELS}/${idx}
    TRAINLIST=${METADATA}/train${idx}.txt
    matlab -nodisplay -nosplash -r "extractFeaturesAndTrain "\
"${TRAINLIST} "\
"${FEATURE_DIR} "\
"${MODELDIR};exit"

    TESTLIST=${METADATA}/test${idx}.txt
    OUTPUTDIR=${ESTIMATIONS}/${idx}
    matlab -nodisplay -nosplash -r "doChordID "\
"${TESTLIST} "\
"${FEATURE_DIR} "\
"${MODELDIR} "\
"${OUTPUTDIR};exit"
done
