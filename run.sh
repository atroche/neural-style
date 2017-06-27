gcloud ml-engine jobs submit training neural_style_test_1 \
--job-dir gs://wombatflow/jobs/neural_style_test_1 \
--runtime-version 1.2 \
--module-name neural_style.trainer.neural_style \
--package-path ./ \
--region $REGION \
-- \
--content gs://wombatflow/data/examples/1-content.jpg \
--styles gs://wombatflow/data/examples/1-style.jpg \
--output gs://wombatflow/data/output/output.jpg



gcloud ml-engine local train \
--module-name neural_style.trainer.neural_style \
--package-path ./ \
-- \
--content gs://wombatflow/data/examples/1-content.jpg \
--styles gs://wombatflow/data/examples/1-style.jpg \
--output gs://wombatflow/data/output/output.jpg
