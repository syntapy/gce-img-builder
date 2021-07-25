Sets up two build triggers to enable use of packer in google cloud builds, along with two corresponding source repositories (also on google cloud) to trigger those builds

Input variables needed:
```
region         = ...
zone_letter    = ...
project_id     = ...
project_name   = ...
project_number = ...
```

Outputs urls of the two source repositories