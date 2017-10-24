# The Methods of Youtube Server

## GET /api/info
Get the video information

Query Parameters:
 	
url – The video url
flatten (boolean) –
If True return a list of dictionaries in the videos field. Otherwise a single dictionary will be returned in the info field.

Changed in version 0.2: The default value is False.

Deprecated since version 0.2: This parameter will be removed in a future version, you’ll have to implemenent this functionality in your client.

* – A whitelist of extra parameters are passed directly to the YoutubeDL object. Currently it supports: format, playlist_items, rejecttitle, playlistend, matchtitle, playliststart, playlistreverse, subtitleslangs, subtitlesformat, allsubtitles, writeautomaticsub, writesubtitles. See the youtube-dl documentation for more info
Response Headers:
 	
Content-Type – application/json
Access-Control-Allow-Origin – *
Status Codes:	
200 OK – On success
400 Bad Request – For invalid query parameters
500 Internal Server Error – If the extraction fails

Example request
```
GET /api/info?url=http://www.ted.com/talks/dan_dennett_on_our_consciousness.html&flatten=False HTTP/1.1
```

Example response
```
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Content-Type: application/json

{
  "info": {
    "description": "Philosopher Dan Dennett makes a compelling argument that not only don't we understand our own consciousness, but that half the time our brains are actively fooling us.",
    "display_id": "102",
    "ext": "mp4",
    "extractor": "TED",
    "extractor_key": "TED",
    "format": "high",
    "format_id": "high",
    "formats": [
      {
        "ext": "mp4",
        "format": "low",
        "format_id": "low",
        "preference": 1,
        "url": "..."
      },
      {
        "ext": "mp4",
        "format": "medium",
        "format_id": "medium",
        "preference": 2,
        "url": "...",
      },
      {
        "ext": "mp4",
        "format": "high",
        "format_id": "high",
        "preference": 3,
        "url": "..."
      }
    ],
    "id": "102",
    "playlist": null,
    "playlist_index": null,
    "preference": 3,
    "subtitles": null,
    "thumbnail": "http://images.ted.com/images/ted/488_480x360.jpg",
    "title": "The illusion of consciousness",
    "uploader": "Dan Dennett",
    "url": "...",
    "webpage_url": "http://www.ted.com/talks/dan_dennett_on_our_consciousness.html",
    "webpage_url_basename": "dan_dennett_on_our_consciousness.html"
  },
  "url": "http://www.ted.com/talks/dan_dennett_on_our_consciousness.html"
}
```
Example request

```
GET /api/info?url=http://www.ted.com/talks/dan_dennett_on_our_consciousness.html&flatten=True HTTP/1.1
Example response

HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Content-Type: application/json

{
  "url": "http://www.ted.com/talks/dan_dennett_on_our_consciousness.html",
  "videos": [
    {
      "description": "Philosopher Dan Dennett makes a compelling argument that not only don't we understand our own consciousness, but that half the time our brains are actively fooling us.",
      "display_id": "102",
      "ext": "mp4",
      "extractor": "TED",
      "extractor_key": "TED",
      "format": "high",
      "format_id": "high",
      "formats": [
        {
          "ext": "mp4",
          "format": "low",
          "format_id": "low",
          "preference": 1,
          "url": "..."
        },
        {
          "ext": "mp4",
          "format": "medium",
          "format_id": "medium",
          "preference": 2,
          "url": "...",
        },
        {
          "ext": "mp4",
          "format": "high",
          "format_id": "high",
          "preference": 3,
          "url": "..."
        }
      ],
      "id": "102",
      "playlist": null,
      "playlist_index": null,
      "preference": 3,
      "subtitles": null,
      "thumbnail": "http://images.ted.com/images/ted/488_480x360.jpg",
      "title": "The illusion of consciousness",
      "uploader": "Dan Dennett",
      "url": "...",
      "webpage_url": "http://www.ted.com/talks/dan_dennett_on_our_consciousness.html",
      "webpage_url_basename": "dan_dennett_on_our_consciousness.html"
    }
  ]
}
```

## GET /api/play
Extract the info and redirect to the URL of the first video found for the requested URL. Useful for media players that accept HTTP URLs. Accepts the same parameters as GET /api/info.

Status Codes:	
302 Found – On success
400 Bad Request – For invalid query parameters
500 Internal Server Error – If the extraction fails
New in version 0.3: Added endpoint.

Example request
```
GET /api/play?url=http://www.ted.com/talks/dan_dennett_on_our_consciousness.html HTTP/1.1
```

Example response
```
HTTP/1.0 302 FOUND
Content-Type: text/html; charset=utf-8
Location: http://download.ted.com/talks/DanDennett_2003-1500k.mp4?dnt
```

Example request
```
GET /api/play?url=http://www.ted.com/talks/dan_dennett_on_our_consciousness.html&format=bestaudio HTTP/1.1
```

Example response
```
HTTP/1.0 302 FOUND
Content-Type: text/html; charset=utf-8
Location: https://hls.ted.com/videos/DanDennett_2003/audio/600k.m3u8?uniqueId=5ed2e870
```

## GET /api/extractors
Get the available extractors

Response Headers:
 	
Content-Type – application/json
Access-Control-Allow-Origin – *
Status Codes:	
200 OK – On success

Example request
```
GET /api/extractors HTTP/1.1
```

Example response
```
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Content-Type: application/json

{
    "extractors": [
        {
            "name": "vimeo",
            "working": true
        },
        {
            "name": "TED",
            "working": true
        },
        ...
    ]

}
```
## GET /api/version
Get the youtube-dl and youtube-dl-api-server version

Response Headers:


Content-Type – application/json
Access-Control-Allow-Origin – *
Status Codes:	
200 OK – On success
New in version 0.3: Added endpoint.

Example request
```
GET /api/version HTTP/1.1
```

Example response
```
HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Content-Type: application/json

{
    "youtube-dl": "2016.04.19",
    "youtube-dl-api-server": "0.2"
} 
```