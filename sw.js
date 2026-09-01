var ASSET = "assets/sounds.swf";

// The cache name is versioned by the manifest hash passed at registration
// (sw.js?hash=...). A new build -> new hash -> a fresh cache, and stale
// caches from previous deployments are removed on activate.
var CACHE = "cube-escape-assets-" + (new URL(self.location.href).searchParams.get("hash") || "unknown");

self.addEventListener("install", function (event) {
  self.skipWaiting();
});

self.addEventListener("activate", function (event) {
  event.waitUntil(
    caches.keys().then(function (keys) {
      return Promise.all(
        keys.filter(function (key) {
          return key.indexOf("cube-escape-assets-") === 0 && key !== CACHE;
        }).map(function (key) {
          return caches.delete(key);
        })
      );
    }).then(function () {
      return self.clients.claim();
    })
  );
});

self.addEventListener("fetch", function (event) {
  var url = new URL(event.request.url);
  if (url.origin !== self.location.origin) return;
  var path = url.pathname.replace(/^\/+/, "");
  if (path !== ASSET || event.request.method !== "GET") return;

  event.respondWith(
    caches.open(CACHE).then(function (cache) {
      return cache.match(event.request).then(function (hit) {
        if (hit) return hit;
        return fetch(event.request).then(function (res) {
          if (res.ok) cache.put(event.request, res.clone());
          return res;
        });
      });
    })
  );
});
