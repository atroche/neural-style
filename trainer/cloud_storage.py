import os
from google.cloud import storage

def open_file(path, local_path):
    if not os.path.isfile(local_path):
        print("Downloading %s from Cloud Storage into file named %s" % (path, local_path))
        f = open(local_path, "w")
        client = storage.Client("wombatflow")
        bucket = client.get_bucket("wombatflow")
        blob = bucket.get_blob(path)
        blob.download_to_file(f)
        return f
    else:
        return open(local_path, "r")

def upload(file, remote_path):
    blob = storage.Client("wombatflow").get_bucket("wombatflow").blob(remote_path)
    blob.upload_from_file(file)
    return blob

