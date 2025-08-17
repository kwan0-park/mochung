'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"manifest.json": "9b9f453ec4a7848f6674fb4e251327f4",
"version.json": "fa62a0f385fd246e09c15612da75b2b8",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/chromium/canvaskit.js": "ffb2bb6484d5689d91f393b60664d530",
"canvaskit/chromium/canvaskit.wasm": "393ec8fb05d94036734f8104fa550a67",
"canvaskit/canvaskit.js": "5caccb235fad20e9b72ea6da5a0094e6",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/canvaskit.wasm": "d9f69e0f428f695dc3d66b3a83a4aa8e",
"main.dart.js": "be4e000f52084559abf91ab16ba827b1",
"index.html": "978cbb67f6ab50680ee7852aad452187",
"/": "978cbb67f6ab50680ee7852aad452187",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/FontManifest.json": "6caa214f216a42dc52d984eb1a97153e",
"assets/NOTICES": "8e0ff0322bf2bc800ddaec371ee0f1f7",
"assets/AssetManifest.json": "685ec9253f719b4cec50194d05c96ab5",
"assets/AssetManifest.bin": "8a22456d8462affc890fff45ce6b8636",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/fonts/MaterialIcons-Regular.otf": "0ec33d6f4e95115222113971d3943fed",
"assets/assets/images/photo/m09_photos.jpg": "bd1ac9b11fb2e4a7e00d68b8512b3334",
"assets/assets/images/photo/m04_photos.jpg": "ee7d6c2498b3b7b7135393d3cd1bfce4",
"assets/assets/images/photo/m17_photos.jpg": "673dfab50edd58771ce828c53217b6a4",
"assets/assets/images/photo/m11_photos.jpg": "3b303531cdd9d58c129db1e6aaffc7b8",
"assets/assets/images/photo/m18_photos.jpg": "a05b7a07c84acffb3b31b7c76e0041e5",
"assets/assets/images/photo/m01_photos.jpg": "2de71efad446fbf3eb9af89394e313db",
"assets/assets/images/photo/m03_photos.jpg": "b89a84baceae1dbc325a4647b0eb9556",
"assets/assets/images/photo/m16_photos.jpg": "11110c06c7f710521c3feafd04b7e0e5",
"assets/assets/images/photo/m14_photos.jpg": "117d05cc784cb917616aee661bd9c4f1",
"assets/assets/images/photo/m06_photos.jpg": "eb5240924a265b257d6a92f9bf2b66e8",
"assets/assets/images/photo/m05_photos.jpg": "0450d8f535c79e4611ddf63272762574",
"assets/assets/images/photo/m13_photos.jpg": "f55f7e4cee2c57c75ea715a01ad3f4ee",
"assets/assets/images/photo/m10_photos.jpg": "40dd438174e951b755c3ee7637e33db2",
"assets/assets/images/photo/m07_photos.jpg": "ff1354a5b7242e3a5c3655ffb0d95ce6",
"assets/assets/images/photo/m15_photos.jpg": "13dbcf7b256631d92de5b171bbc74157",
"assets/assets/images/photo/m08_photos.jpg": "497468283544da75fa955d3a18c79214",
"assets/assets/images/photo/m02_photos.jpg": "a464c9933a60a2561e5a627012de725a",
"assets/assets/images/photo/m12_photos.jpg": "8d6373c020d7211934741c848e6508b2",
"assets/assets/images/intro_01.png": "db088e711f016f8ca287f35c8f4258da",
"assets/assets/images/invitation_otter_cropped.png": "048e52a404c12f33a9e33843c5ac24df",
"assets/assets/images/intro_03.png": "d6916fcf189c7a8acda4bf80e3aec75a",
"assets/assets/images/intro_02.png": "23edf2df5064c1e0c7c6e4421e53f9d5",
"assets/assets/images/welcome_boris_barbara.png": "73273e187332afb4b06d1a7abc790b06",
"assets/assets/images/welcome_getting_married.png": "4275c417878ff0788494e391587b9d6c",
"assets/assets/images/welcome_boris_barbara_org.png": "cdd1d843ec9657772a7aab127698ef86",
"assets/assets/fonts/GowunBatang-Regular.ttf": "9c229195073bb2e4de42ff8a541e6eee",
"assets/assets/fonts/GowunBatang-Bold.ttf": "04977f1734ccba2e1525b50660f96458"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
