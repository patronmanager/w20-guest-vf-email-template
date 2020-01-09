# Winter '20 VF Email Template

## Create a scratch org and assign Perm Set to Site Guest User
```
sfdx force:org:create -f config/project-scratch-def.json --setdefaultusername
sfdx force:source:push
```

## Assign the Perm Set to the Guest User

```
sfdx force:apex:execute -f scripts/apex/guest.user.permset.apex
```

## Load the VF page

```
sfdx force:org:open
```
Then visit the Sites page in Setup and navigate to your new Site
```
https://<your Sites domain>/sample/EmailExample
``` 
