'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "1a4a097e17ceee03ae7a8df9253ac51a",
".git/config": "d86a56d52a7d81ab0c17e4b06be97f39",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "0ebe7628bd41c07a6f0956fcfcb38d2f",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "5fb403cc15c2bf86274697f5f08cfdc5",
".git/logs/refs/heads/gh-pages": "5fb403cc15c2bf86274697f5f08cfdc5",
".git/logs/refs/remotes/origin/gh-pages": "ed8470d9992c13b81e2da3c163389b24",
".git/objects/02/d379985de129bf1118143f9405993014d84a88": "49a3fd720a605cdff3cce75df2a0f8a8",
".git/objects/05/a9058f513cce5faf1704e06e3c150688b0a01f": "e8d02f60cf87abd4c1de4b153dd696dc",
".git/objects/0e/1d4c521b32de439bed32c3c39098ea3ff97b81": "9e7678f01523a078e33bad29a46097fb",
".git/objects/15/411fea0036401c82286f878a3fbfdc705c4ed6": "5936bcbef4a5e952015a12c8c2278aea",
".git/objects/17/a44350cc652f03b9ff92fdae89f3ef52cd84d8": "4455e7fbbab3673392a661f80a04ad74",
".git/objects/1c/a11f13ae04a8bdeb094f2c64a2c4767b66f443": "d156ab077305ae53a7148fed4acae722",
".git/objects/1c/fbd64269bf97c2e77108ba93ed421d24b0910f": "3e8a0453af62bc64887e57e23387cdcc",
".git/objects/1f/7a338b7e781d7fb79c737bd7eb9597d698f74f": "a853f90f33bfeca7dcccee594c79e3ee",
".git/objects/26/62893b3636b500ea387b3806fe2880c51a77b6": "804dd50104cf0aa70084f972db175c0b",
".git/objects/27/1ead5c729bcae960459f0dc92c578d2668244a": "6dcdde3f969317b8b7eb857b2916be5a",
".git/objects/27/a297abdda86a3cbc2d04f0036af1e62ae008c7": "51d74211c02d96c368704b99da4022d5",
".git/objects/30/1ab020dddc56f3e0fa02c974b742194d580540": "1dbd0dbfc1880160d6ae7096d14e6cea",
".git/objects/32/41541732de657af33edcf6d8dc27ed5fe11ae6": "433e36a7ea1314f33fc3662cb8403f1e",
".git/objects/33/b4d777f95666c2dd44de604223d53c856b8309": "9fb9b42d8ea87e2c6edc7ee03545b3ae",
".git/objects/37/6cce7c520bd27a653a133d48f3857342253e9e": "5f6f1aebeee4c4aa3bbd07e68f1415d5",
".git/objects/3a/bf18c41c58c933308c244a875bf383856e103e": "30790d31a35e3622fd7b3849c9bf1894",
".git/objects/4a/91def1a81167b13fca422831d978c2e765b725": "2df552ba3ccb3c91d0d5f0294572e855",
".git/objects/4f/6b38cab1b7ca2ffdb6beddf6f5c7aa221c1d24": "78721b6be7743cf22a2e58b35000ecb5",
".git/objects/62/3bf75eb65abb5bd4640a083751021d03a7f1df": "8b9e88719b101bd0f25445d37d3b43fe",
".git/objects/63/6931bcaa0ab4c3ff63c22d54be8c048340177b": "8cc9c6021cbd64a862e0e47758619fb7",
".git/objects/6b/3d63ff829d0aebbdf59c595f117a12b6438c3b": "2b5d1927195c5215c63bb4e2fac8b1ee",
".git/objects/6d/5f0fdc7ccbdf7d01fc607eb818f81a0165627e": "2b2403c52cb620129b4bbc62f12abd57",
".git/objects/6f/148fbb7e8e929b78983c667279f5938db57e0c": "46cde962a7a486706fa8d9be04565a75",
".git/objects/6f/9e52041edc69469370e6fcac69ba14954a0d40": "55fff1c18becebec9b49a3f7f2a76d67",
".git/objects/73/7f149c855c9ccd61a5e24ce64783eaf921c709": "1d813736c393435d016c1bfc46a6a3a6",
".git/objects/7b/1abcddb21b4c8ea552e2d200c4fb6f8bc01758": "732cf347eb5739351637a50236df8919",
".git/objects/7b/74e29102f961e7118605a3f262c0ae4f1acc82": "42da040217cdc830214e6353efbc756d",
".git/objects/81/4502f4823a5b1054fd5b5f455b4926a7a35751": "c04c8a04005830e552e1c0f9a0af55d8",
".git/objects/81/71b5416b71cd5ab5c9068ebe30b90f72933b0f": "96f7b20a48dd91cbccc1f0f91da02b53",
".git/objects/87/4889180920d60ff9ef380684f782b26fcedd4b": "f99fc282185002f7a69d4b936cb8f0b5",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8c/59773bee8314a8ffb4431593d0fb49f52e34c6": "2eb993d30677573ffd0e58484cc6a514",
".git/objects/97/8a4d89de1d1e20408919ec3f54f9bba275d66f": "dbaa9c6711faa6123b43ef2573bc1457",
".git/objects/ad/4f8b264db7a36b480bdc8b82e8ae013ddbec28": "3e4af1fa651cc38a8f80fa8bd6ae341e",
".git/objects/af/31ef4d98c006d9ada76f407195ad20570cc8e1": "a9d4d1360c77d67b4bb052383a3bdfd9",
".git/objects/b1/5ad935a6a00c2433c7fadad53602c1d0324365": "8f96f41fe1f2721c9e97d75caa004410",
".git/objects/b1/afd5429fbe3cc7a88b89f454006eb7b018849a": "e4c2e016668208ba57348269fcb46d7b",
".git/objects/b3/81ed34aadcf15729a3289ea214d57281ccedbd": "a4c97155c41ec62609f1848852e59383",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/c3/e81f822689e3b8c05262eec63e4769e0dea74c": "8c6432dca0ea3fdc0d215dcc05d00a66",
".git/objects/c6/06caa16378473a4bb9e8807b6f43e69acf30ad": "ed187e1b169337b5fbbce611844136c6",
".git/objects/d1/39926f4158614a8e4db62b5339fc8d9c4b504c": "20f9509452c636807559a2f1148fc94e",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d9/8cd3145ba50d69b2bc554f1ffdf20c94a1fd55": "074ae708c02bcb5a6e91f0ffc5efeaf0",
".git/objects/dc/5a93b22a1aa5dd5fff4f9ae2792c4a54b3e760": "afa205cfdf261f86ca7c37be8b549783",
".git/objects/de/85d5b400e6db170d02f8de89dfc6a70f28eb5b": "cee8b512b0d10f2c6b3442550fa4d331",
".git/objects/e0/152c5e130d3667b0d4f940ec2dfbd19ce2a813": "b389fa5cb866bd2f2cdcd83efc151a1b",
".git/objects/e6/0ca4e78f5ebeb3dccdd8ca4cf5fceb78916182": "9972635952b346e50ee73e6ae8c3aec0",
".git/objects/e8/b4039f01534cc95b83d9b9fd33c3322536c10c": "379549d6441fd7e4bcf88cbdf73e0ef1",
".git/objects/e9/1fe5be61e9b921692e232897ed053b9ed28a9d": "db3d528f63e4e34e5ef131c2d529c321",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ec/361605e9e785c47c62dd46a67f9c352731226b": "d1eafaea77b21719d7c450bcf18236d6",
".git/objects/f1/3d02d5313eb8bd28e5342a934869c18c925798": "7a36fa97d2d5eb8f5f79408f5787ffde",
".git/objects/f1/aafd706e8f88613f98c6657ad21d570f91e3fb": "4f60a5160470db4525c7de3867f2a68e",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f4/08de63f885134eea01cebab131f64f7124884b": "8d397cddeb6ebddc039a7f85c29e9f7b",
".git/objects/f7/d2ff414ca04760e0f0911809f2783038c8233d": "63c1c5af885d0f4c5425a26dd167bd57",
".git/refs/heads/gh-pages": "c9761fd7693133e1883b98cff3e8b66a",
".git/refs/remotes/origin/gh-pages": "c9761fd7693133e1883b98cff3e8b66a",
"assets/AssetManifest.bin": "652679c9afe6537f252ac63df3575b60",
"assets/AssetManifest.bin.json": "0f0efb1e64b5d0f69b2c0227215127fd",
"assets/AssetManifest.json": "081d4331d8ae54d85e788de34853ae93",
"assets/assets/kiis.png": "c6a974ef5f5f1a0594c6cc441423b062",
"assets/assets/M_omo.png": "6c307b9eb26cf6e0b11551391df59072",
"assets/assets/M_ura.jpg": "af0a01e70e2a386b854022f584465eaa",
"assets/assets/R_omo.png": "bfb31452feb3b0a0902e16a881a68383",
"assets/assets/R_ura.png": "1a482d128393e43b25fb1eb6803a584a",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "364eaf5383e0e2719797649dd1be689b",
"assets/lib/i18n/en_US.json": "110d91aaf7b164037cc8fa6ce86f4d9d",
"assets/lib/i18n/ko_KR.json": "4174f48420bed419ce85bb1f5279ce1d",
"assets/lib/i18n/ne_NP.json": "a5e63906a51cd1b3501c21280bfd14c9",
"assets/lib/i18n/zh_CN.json": "b2626ffa4f568a56edb3e086d33609ad",
"assets/NOTICES": "fdaa2248e040e39bda5d54e7720bba24",
"assets/packages/localization/test/assets/lang/en_US.json": "18804652fbce3b62aacb6cce6f572f3c",
"assets/packages/localization/test/assets/lang/pt_BR.json": "f999b93065fe17d355d1ac5dcc1ff830",
"assets/packages/localization/test/assets/lang2/en_US.json": "b389499c34b7ee2ec98c62fe49e08fa0",
"assets/packages/localization/test/assets/lang2/pt_BR.json": "08e9b784a138126822761beec7614524",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "7bdf6ab7beb622f4650521a669274e4d",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "a6b00ff5552fe03589db69885086e6dd",
"/": "a6b00ff5552fe03589db69885086e6dd",
"main.dart.js": "d493b1996e6c4e5bd6d48de756f9816f",
"manifest.json": "ca73f5bfa40bd3c2bce81ce797dfaed1",
"version.json": "eb929bc5703ddf1211d25f0b47550786"};
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
