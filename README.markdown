The Integer Club
----------------

The Integer Club is an HTTP API for retrieving unique, incrementing integers.

## Get a new integer

The Integer Club will return an incrementing value for each unique URL. Each
new value starts at 1 and increments by 1 for each request.

    → curl 'http://integer.club/jasodifjasdf/zxcv3'
    204

    → curl 'http://integer.club/jasodifjasdf/zxcv4'
    1

## What's this for?

I don't know .. but let me know if you figure it out.
