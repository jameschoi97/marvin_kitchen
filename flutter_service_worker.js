'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "bb10c7bbda4c5da8927f0383c60cd88e",
"index.html": "d8db99058c136f97538e4c0a3657134c",
"/": "d8db99058c136f97538e4c0a3657134c",
"main.dart.js": "bcb0e9e62ed34d9342a346eeafe7ebd5",
".git/config": "24cedcbb65c85bcbbd757f2ef2afe482",
".git/objects/0d/6fafff3d9b272c48d600e9635b752532817841": "52124140f9e20ff59b8f4e09ea382908",
".git/objects/0c/4e05790cfc5ad83280653ec0343a2d868256e0": "b91c6519bbf7c09b26b7f3bfc2aece9f",
".git/objects/3b/0ec833c0e47780185ac3c7b3e3d3c6eb39c483": "045e81ac979c61d012ac6241f8f6681b",
".git/objects/03/eaddffb9c0e55fb7b5f9b378d9134d8d75dd37": "87850ce0a3dd72f458581004b58ac0d6",
".git/objects/3c/5778829e9322504a0fef63cb436d00a37dd747": "c016ac69f22b772174a122e1a4e13cff",
".git/objects/3d/51c3eecb1439a77592779537ddac18a343959e": "39eaadab6f7bb166ad1fb5ac900792df",
".git/objects/d9/865cb62813ec6ec9ef30a9d4fe564bafee12d2": "0950410e28740d103f17f68e8e999db4",
".git/objects/ac/0c3af22b5820aadfea1083cadf57bad6232e15": "7f00810867253e10973d5946bc38b220",
".git/objects/a2/7b080ff725b736090568ec52e7faacf379a3bd": "adcebc1d349ecd9b457d2f775421b5ca",
".git/objects/ab/0e98497a51ead7821d1da35a24968ff314e50f": "557c35fe3928eb2af403d1b3926bb9ba",
".git/objects/e5/951dfb943474a56e611d9923405cd06c2dd28d": "c6fa51103d8db5478e1a43a661f6c68d",
".git/objects/f3/c5cbf7d91a8c21ba5d0a5448288bad91280651": "3f33e33d31ac504c9018d70d8f9f1961",
".git/objects/f2/5787c93ad00665f0f797a43ab397f0628a273e": "59e425d1456034072d902c75d18ec75f",
".git/objects/73/6f61b3c3f944d60afd650bccf48f1399b19810": "0f106e9dd1d6f9d9417223c70eb4b4b2",
".git/objects/7b/523596f696f6dbcd8d12ab62d3c1e88c9125ad": "633c9137f4775a689583f807bb61943d",
".git/objects/8f/0192f77a8b8dd557934aee7afc8871733118cc": "901bfaef830d6f1120ced376f245f9b9",
".git/objects/10/e3b51ac5a357805a2937b35e95a9e4cafcba02": "fe73ac9fbafa840183361137b22d8b02",
".git/objects/4c/51988db024bc8a01952f706695cb45d9636852": "9e0698d6dfc8c207443ba1eb39859cd1",
".git/objects/21/186f075306aa98818a23baed189edc7bd378fc": "b06f5eb419f2aaa723d551e822c6ea03",
".git/objects/72/2a5a2d076412f75411ef019d769e711135089a": "209f4f63984eacd6957f2e40f25df29d",
".git/objects/2a/1e7e9624979f6dd216db2a5af4af0c462853a0": "534083e4d2c51ae8e524cbf420a68e28",
".git/objects/43/88108774108d62932c7d6b17a68891d6e8fd47": "bcb45307ab5f1beb066b78802c94c849",
".git/objects/07/8e80040feac230457877dee4a91edd8d8b8511": "2a7c62488aca1a15460efa6234264e8c",
".git/objects/38/467c58cbf6dd427e04b22ce8c9d5ac451e16fe": "112378199a34f24f8e032eba4850b0c7",
".git/objects/36/6ba5dfa895a8b0b26c14a268ca3600441d2cb4": "d15662750bb82e49fa6b008f2c23d2c0",
".git/objects/91/3d775816e85aa166e294eef71ec5550556b567": "16e42380984c8c18c79c3e4a991b2c76",
".git/objects/5b/5bf607740d18f8ae0c72687f02f05fcaba3ca4": "4181e69f354dca86164d5ae45757907b",
".git/objects/37/853436347f7072a20ce8e0e5c5c9a3b0593e31": "f7b9cef8f0fe7c018f530f3b3f174dd8",
".git/objects/6d/ac18af4ea0678d6e24dd7b9d32079da114b96a": "015772316bf47caeaa1ccae11b13eeac",
".git/objects/bf/eac057b6d3dcb7894855a43868924d3a5aaa7c": "c13982d27b56693c4539c88f4922eb6b",
".git/objects/ba/6af82b397696b8069110e798055e768916777e": "840696bbbe8875d360a1d56ea36ec3ed",
".git/objects/a7/75cbbd3d5553c86b2255cdd4f480eaed5eddea": "88a20c21f22a0ad93dd77377b09b432a",
".git/objects/b6/7e9b1118573127c4a3e94bd21a9af816e39525": "6cc7079ab7c5bb77b7cb26927a242139",
".git/objects/aa/a59417ccbef33d1dfcfaa06e436e77a8955179": "02870051dede9ab2653b1ca982d85c90",
".git/objects/a8/3a17d54b6dc2156c855c6580301cefc9c8d017": "6525101be8d70b808a809af9c83fa4ad",
".git/objects/a1/3837a12450aceaa5c8e807c32e781831d67a8f": "bfe4910ea01eb3d69e9520c3b42a0adf",
".git/objects/c4/c45c35dc99c52ac09c6e94017375117e523e7e": "3dde57f95acd768c9ff50ee03e511dd7",
".git/objects/cd/ef4131e354874a3e3822366aa31e2d8b02b4d3": "21fdef015e8aa5376dbaead3d96fb8fa",
".git/objects/e6/9de29bb2d1d6434b8b29ae775ad8c2e48c5391": "c70c34cbeefd40e7c0149b7a0c2c64c2",
".git/objects/f0/79a282db35dd2779358a33c27234b02ae017cc": "24176e51820d41a8e20051ac38a20fbc",
".git/objects/f8/4657af5ff632a85debd4a6484cd7b6e69ed570": "2b35901cbc2b44aedc108b9cae52f35e",
".git/objects/ce/a80fc505d515aaecc6480f32882eff056ae48e": "031cf05ea70a826ec874e99068d65428",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/79/ba7ea0836b93b3f178067bcd0a0945dbc26b3f": "f3e31aec622d6cf63f619aa3a6023103",
".git/objects/48/27d37a44d2e7545ca6fcafb87022e0f2379f09": "8a9936ffc3a68d6bc1f41ba2f16b5296",
".git/objects/8d/4dac7cdff069d15a7e686205029e81edd76dc3": "ddfb4dd8abad24d4ddc0a53f8974886c",
".git/objects/8e/3f0caf2182c693cc600749a672701e561c4861": "08056f6489cc904e90e34d0c8ae1ab8e",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "68d4790a734677a28dce711f026fdd86",
".git/logs/refs/heads/gh-pages": "41721fea7abf9c8455a1279ae816c8cd",
".git/logs/refs/heads/master": "808c9f1a696ef05b8f5cf6e7cc901168",
".git/logs/refs/remotes/origin/gh-pages": "071642d8ce13b77fc16c6984a961e2ef",
".git/logs/refs/remotes/origin/master": "1cdd647ecd87206f8981776d9c7a0015",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "ea587b0fae70333bce92257152996e70",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/gh-pages": "fb43cfb002b6f18ceba2e63089c2c036",
".git/refs/heads/master": "cee838e882dd6f1d07977eff023180bc",
".git/refs/remotes/origin/gh-pages": "64a408fa5451c56a24735a814672e39c",
".git/refs/remotes/origin/master": "cee838e882dd6f1d07977eff023180bc",
".git/index": "cba3c69034fd8e6e4e0dce4e3a0425d4",
".git/COMMIT_EDITMSG": "116375e830ba3da45d786dc30e09f046",
"assets/AssetManifest.json": "3949e138de716f1409453665bb0fc5fb",
"assets/NOTICES": "71bd6fda753dd9ca02120d8737ab3fc5",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/assets/christmas_background.jpeg": "35920f306cc847a7bf3353c837b0502b",
"assets/assets/starwars_background.jpeg": "b5b6620c05b9b1a5ee9f1032eae2f8c7",
"assets/assets/homescreen.jpg": "db120127aeca7f2c673b8572a66d8677"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
