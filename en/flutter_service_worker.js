'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"icons/web-app-manifest-512x512.png": "53e990dee113a13e18068b4d15aeb9c3",
"icons/web-app-manifest-192x192.png": "a2de5abadab2c5c7fe05233c5506be85",
"icons/apple-touch-icon.png": "2396bd519e01545ca2b47e969ccf51d0",
"manifest.json": "11aba76632318e2dbfcdecaa1807ab52",
"index.html": "8e9750ef4f8de24ce2a27313cf6e8ae0",
"/": "8e9750ef4f8de24ce2a27313cf6e8ae0",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "41d7d96278e8dbd25848e63424db92b5",
"assets/assets/images/invitation_otter_cropped.png": "048e52a404c12f33a9e33843c5ac24df",
"assets/assets/images/ribbon.png": "9c4ebd5320b5d7603e4b63e12a3bd800",
"assets/assets/images/kakaomap_basic.png": "5f96194fd49ed7cbd34c3a248641a42a",
"assets/assets/images/navermap_icon_2.png": "129eb82fbd6a3c4880d663b803e62fdb",
"assets/assets/images/paper3.webp": "c9a01ba8061191b508c2ab5266979831",
"assets/assets/images/map.webp": "40c108d240fa3f4f39fa8db755171211",
"assets/assets/images/intro_02.png": "23edf2df5064c1e0c7c6e4421e53f9d5",
"assets/assets/images/intro_03.png": "d6916fcf189c7a8acda4bf80e3aec75a",
"assets/assets/images/boris_barbara.webp": "3f4ba8a269d85af349adc9e97d80f78f",
"assets/assets/images/paper2.webp": "a0fa199b69c00a01cfdfbb244462d833",
"assets/assets/images/bg_img_white.jpg": "e4dae526a29570b3ee9d8934f77af0c3",
"assets/assets/images/photos/m05_photos.webp": "c8ba7dc082a930ba647f856a23e80de1",
"assets/assets/images/photos/m41_photos.webp": "2505be4134925b898314f1d7460c827d",
"assets/assets/images/photos/m12_photos.webp": "d8a7ddfed0e7dc9281f4e166e5b761dc",
"assets/assets/images/photos/m07_photos.webp": "909ce1003be9fbbf5883b39616479d89",
"assets/assets/images/photos/person_pky_photos.webp": "c0468291c3f7830710d560b44a53b930",
"assets/assets/images/photos/m10_photos.webp": "f9f2a0078aa14b18014a4cc0d9acdbc0",
"assets/assets/images/photos/m49_photos.webp": "a744d1f7bf56d0f8289e99692f6e773e",
"assets/assets/images/photos/m01_photos.webp": "a06cb1660c86571b84cbc91ef2cd2828",
"assets/assets/images/photos/person_jbk_photos.webp": "61044f2bc25570bc99078926af809131",
"assets/assets/images/photos/m02_photos.webp": "22c1ea5eb5c5888e9c05666da8fd1da4",
"assets/assets/images/photos/m25_photos.webp": "8d71185005337216fbd2c23a2bb2571b",
"assets/assets/images/photos/m26_photos.webp": "158699cb1c8d236a6ee9840b9f6f3bec",
"assets/assets/images/photos/m46_photos.webp": "568a72f92ccb9b324f0feb4f93c86644",
"assets/assets/images/photos/m04_photos.webp": "fd557c5e85312f899333dbfb8c0e05c2",
"assets/assets/images/photos/m06_photos.webp": "a7b5fb1bd28c29bc602fae3c056cef33",
"assets/assets/images/photos/m42_photos.webp": "4c26a92761c405f6ca8dfa10cb216582",
"assets/assets/images/photos/m27_photos.webp": "34b100aa7b3f1bd6dad50ea6602b3881",
"assets/assets/images/photos/m03_photos.webp": "585cd13f591279d74028fb553e19b9c4",
"assets/assets/images/photos/m28_photos.webp": "ea4c3bb66cee6dba520c365c1537a040",
"assets/assets/images/photos/m22_photos.webp": "dc8637d14813fdefa90fee96b546fd56",
"assets/assets/images/photos/m24_photos.webp": "0906f8cbf6c0b29c4c25cb319710c1ee",
"assets/assets/images/photos/m47_photos.webp": "0d91db4346c0c671b39a7b16440ff8cd",
"assets/assets/images/photos/m29_photos.webp": "f92eb13b2b944578d99af37d6a22625e",
"assets/assets/images/photos/m21_photos.webp": "d60a8b7f63d652cba8fe2bbb64e2c79e",
"assets/assets/images/photos/m44_photos.webp": "cf3c1c4407be71681911856441e28787",
"assets/assets/images/photos/m11_photos.webp": "c3df880f624306133259e6f18bd7d0b7",
"assets/assets/images/photos/m48_photos.webp": "bb75bb299fd8f49ee93dcfcb2a6f2164",
"assets/assets/images/photos/m45_photos.webp": "60b34abd85c3e8b9fcf953f2b8ae0697",
"assets/assets/images/photos/m09_photos.webp": "874f71ac45e3c6ea10a7c1783503a5ed",
"assets/assets/images/photos/m23_photos.webp": "f80ab8bafdbb22c7f4e0835e0bc95946",
"assets/assets/images/photos/m08_photos.webp": "ee8cb7cc65a4d93d226ce9a8507df946",
"assets/assets/images/photos/m43_photos.webp": "af394e815c8ebee72eb50cdf4d772806",
"assets/assets/images/paper.webp": "c9f64e5e6572301bc1fa3406054b8a12",
"assets/assets/images/intro_01.png": "db088e711f016f8ca287f35c8f4258da",
"assets/assets/images/welcome.webp": "28f4c1d9264c89c8f64bcec4ae77dc6c",
"assets/assets/fonts/SpecialElite-Regular.ttf": "0361d96faa98b0a716bec7e56e794c3d",
"assets/assets/fonts/Pretendard-Bold.ttf": "dfb614ebecd405875f50a918ca11c17c",
"assets/assets/fonts/GowunBatang-Regular.ttf": "9c229195073bb2e4de42ff8a541e6eee",
"assets/assets/fonts/GowunBatang-Bold.ttf": "04977f1734ccba2e1525b50660f96458",
"assets/assets/fonts/Pretendard-Regular.ttf": "d6e0de06bff8b7fda2db4682168e3ddf",
"assets/assets/fonts/Pretendard-Light.ttf": "77ecd2ca94928e38ff7c68bb255324f7",
"assets/fonts/MaterialIcons-Regular.otf": "9cd42fd1d6390f3d32512674a5ba42e3",
"assets/NOTICES": "6298e1982f29c81dbfa7e9de6f5b83cc",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/FontManifest.json": "e62bb85d92a5ff40c53b5537c2562318",
"assets/AssetManifest.bin": "a7dab305cddc1610ee64e0bdf74f84bb",
"assets/AssetManifest.json": "87c5e0d48a741be5b1e3e99c172f2c16",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"favicon.png": "e2253c006e72b2a1d8f600550f963fe9",
"CNAME": "a69bc9fdd2f911f8518cf4b6a5c1d985",
"flutter_bootstrap.js": "ee0ef0836943ba4b6ac0d11572287666",
"version.json": "fa62a0f385fd246e09c15612da75b2b8",
"main.dart.js": "bdf8f072a91cff9a21f16f9f43970267"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
