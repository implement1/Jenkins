# Overview

This project provides a packer template to build a custom Windows Server 2016 Active Directory Domain Controller as an AWS AMI

# Build instructions 

## Validate Packer file before run
```packer validate ./win_ad_dc/windows_2016_ADDC.packer.template.json```

# Build
```
Modify vars in template.json:

      "profile": "default",
      "region": "us-east-2",

packer build ./win_ad_dc/windows_2016_ADDC.packer.template.json
```

NOTE: Packer builds to AWS are notoriously flaky. If you see events like being unable to download Choco, kill the build and start over. 
