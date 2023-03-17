**Run command**
> bash script.sh -p <path_to_docs_folder> -b <sphinx_builder_image_tag_name> -t <output_image_tag_name>

* `path_to_docs_folder`: absolute path to docs folder
* `sphinx_builder_image_tag_name`: name of sphinx builder image
* `output_image_tag_name`: name of final ready-to-go webserver docker image

**Example**
* Run script
```
bash script.sh -p /home/user/official-document-project/docs -b my-sphinx-builder -t my-docs-webserver 
```

* Result
```
Check local docker image (docker image ls) => get 2 new images:
my-sphinx-builder, my-docs-webserver
```

* Run final webserver
```
docker run -p 81:80 -d my-docs-webserver
```
> open [http://localhost:81](http://localhost:81) to see the final output.