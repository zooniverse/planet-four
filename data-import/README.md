# Data Import

Put the list of files in `/data/planetfour/files.csv` on a `generic-efs`
instance on EC2. This requires quite a bit of memory, so you'll want to launch a
`t2.large` instance. Then run:

```
docker run --rm -it -v /data/planetfour/:/data/ zooniverse/planet-four:data-import python /usr/src/fetch_metadata.py
docker run --rm -it -v /data/planetfour/:/data/ zooniverse/planet-four:data-import ruby /usr/src/fetch_source_file.rb
docker run --rm -it -v /data/planetfour/:/data/ zooniverse/planet-four:data-import ruby /usr/src/create_manifest.rb
docker run --rm -it -v /data/planetfour/:/data/ zooniverse/planet-four:data-import ruby /usr/src/uploader.rb
```

Then run `build_subjects.rb` in an Ouroboros shell.
