
# README


First of all, thank you for giving me the opportunity to take up this challenge.

I tried to not exceed the defined time (4h) that's why i have only focused on the core of the specs: Provide the ability to fetch and create projects and floorplans with different image versions.

It was the first time i use active storage and rails 6, i choosed active storage as it's already implemented in rails, so no need additional gems / dependencies.

I tried to do something clean and tested but i am aware so it's not totally covered and not documented (with swagger for instance) as i did not want to exceed the defined time.


### GET projects:
```shell
curl http://localhost:3000/projects
```

### GET project:
```shell
curl http://localhost:3000/projects/1
```

### POST projects:
```shell
curl -X POST \
  http://localhost:3000/projects \
  -H 'content-type: application/json' \
  -d '{
  "project": {
    "name": "project_one"
   }
}'
```

### GET floorplans:
```shell
curl http://localhost:3000/projects/1/floorplans
```

### GET project:
```shell
curl http://localhost:3000/projects/1/floorplans/1
```

### Create floorplans:

    curl  -F "floorplan[main_image]=@./spec/fixtures/files/floorplan.jpg" -F "floorplan[name]=floorplan_v2" http://localhost:3000/projects/1/floorplans

```json
{
  "original": "http://localhost:3000/rails/active_storage/disk/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdDVG9JYTJWNVNTSWhaMkpzYTNBNGJqVXllRFJ5YURSa1pXcHFPRGxuTW5GdE5tcGtlUVk2QmtWVU9oQmthWE53YjNOcGRHbHZia2tpUldsdWJHbHVaVHNnWm1sc1pXNWhiV1U5SW1ac2IyOXljR3hoYmk1cWNHY2lPeUJtYVd4bGJtRnRaU285VlZSR0xUZ25KMlpzYjI5eWNHeGhiaTVxY0djR093WlVPaEZqYjI1MFpXNTBYM1I1Y0dVaUQybHRZV2RsTDJwd1pXYzZFWE5sY25acFkyVmZibUZ0WlRvS2JHOWpZV3c9IiwiZXhwIjoiMjAyMS0xMi0xMlQyMToyMDozNC44OTlaIiwicHVyIjoiYmxvYl9rZXkifX0=--7f5ce8a1fcd92196c2c19dde873068719f48f589/floorplan.jpg",
  "large": "http://localhost:3000/rails/active_storage/disk/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdDVG9JYTJWNVNTSWhOM2g1TVdab2NtVjZObk5oZERrek1YRmhiMnMyWVRCa09YTmtjZ1k2QmtWVU9oQmthWE53YjNOcGRHbHZia2tpUldsdWJHbHVaVHNnWm1sc1pXNWhiV1U5SW1ac2IyOXljR3hoYmk1cWNHY2lPeUJtYVd4bGJtRnRaU285VlZSR0xUZ25KMlpzYjI5eWNHeGhiaTVxY0djR093WlVPaEZqYjI1MFpXNTBYM1I1Y0dWSklnOXBiV0ZuWlM5cWNHVm5CanNHVkRvUmMyVnlkbWxqWlY5dVlXMWxPZ3BzYjJOaGJBPT0iLCJleHAiOiIyMDIxLTEyLTEyVDIxOjIwOjM1LjEwM1oiLCJwdXIiOiJibG9iX2tleSJ9fQ==--765eeaa17f8712a3180d45277038b1047b0b6a57/floorplan.jpg",
  "thumb": "http://localhost:3000/rails/active_storage/disk/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdDVG9JYTJWNVNTSWhkV3MxWnpac1pHdzVZM1poTldFM05HeDJaM1Z4TVcxNlkzZDVaQVk2QmtWVU9oQmthWE53YjNOcGRHbHZia2tpUldsdWJHbHVaVHNnWm1sc1pXNWhiV1U5SW1ac2IyOXljR3hoYmk1cWNHY2lPeUJtYVd4bGJtRnRaU285VlZSR0xUZ25KMlpzYjI5eWNHeGhiaTVxY0djR093WlVPaEZqYjI1MFpXNTBYM1I1Y0dWSklnOXBiV0ZuWlM5cWNHVm5CanNHVkRvUmMyVnlkbWxqWlY5dVlXMWxPZ3BzYjJOaGJBPT0iLCJleHAiOiIyMDIxLTEyLTEyVDIxOjIwOjM0Ljk2OFoiLCJwdXIiOiJibG9iX2tleSJ9fQ==--01c4d81f50bdf858df220e49bdb9917af698163a/floorplan.jpg",
  "name": "floorplan_v2"
}
```

As you can see, we got "original, but also resized versions: thumb" and "large"
