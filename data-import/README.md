# Data Import

Put the list of files in `/data/planetfour/files.csv` on a data processing
instance on EC2. (Make sure the data processing EFS volume is mounted with NFS
first.) Then run:

```
docker run --rm -it -v /data/planetfour/:/data/ zooniverse/planet-four ruby /usr/src/app/fetch_source_file_and_metadata.rb
docker run --rm -it -v /data/planetfour/:/data/ zooniverse/planet-four ruby /usr/src/app/create_manifest.rb
docker run --rm -it -v /data/planetfour/:/data/ zooniverse/planet-four ruby /usr/src/app/uploader.rb
```

Then run `build_subjects.rb` in an Ouroboros shell.
