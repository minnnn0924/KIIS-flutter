'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "500a24f91923241a8662d8b41b884f17",
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
".git/index": "908b8b21b501e4fa9a8d075a10899903",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "6d3002de02fab2c417e14c49ac01cd2d",
".git/logs/refs/heads/gh-pages": "6d3002de02fab2c417e14c49ac01cd2d",
".git/logs/refs/remotes/origin/gh-pages": "f45cf0371f0e815ae34d3a09ae2a9e77",
".git/objects/04/fbd496309a603eed0d0ca51b1e8a90548bf192": "36ef1aff957c0f534809f665febd1efe",
".git/objects/05/a9058f513cce5faf1704e06e3c150688b0a01f": "e8d02f60cf87abd4c1de4b153dd696dc",
".git/objects/0e/1d4c521b32de439bed32c3c39098ea3ff97b81": "9e7678f01523a078e33bad29a46097fb",
".git/objects/12/5705dc3441a3bd8d3ca5a651f459cbfb936556": "2ec8ab73ca8492f98746fb2514ad675d",
".git/objects/17/1109a936a04a408d5ac161c658ce19aa434011": "0eb45b23b732cb1b8b939edc7650acf2",
".git/objects/1e/15e9b52735ae48c16ee32429db698d46f94671": "5e8d79865a73bcd22e40c16abe4432cb",
".git/objects/27/1ead5c729bcae960459f0dc92c578d2668244a": "6dcdde3f969317b8b7eb857b2916be5a",
".git/objects/27/a297abdda86a3cbc2d04f0036af1e62ae008c7": "51d74211c02d96c368704b99da4022d5",
".git/objects/28/49198cc23f46209010068f097b65474e0d741e": "aceb6c6ebb57172c64fa2163e23d1761",
".git/objects/2c/f1bc64c581a5498ce14119f63e14cc97afb90c": "ac5e1d74d31d3c91fb78950671c651f0",
".git/objects/31/4cc95d29aa8d0540bb215898d4733456703ad1": "57fa54b5fc45122a4c7de08cb58e4e78",
".git/objects/34/f08c1944cc9d2c38e1adcb4899080067331d73": "a1c31e4aca69eccca0c44caf125191b4",
".git/objects/37/6cce7c520bd27a653a133d48f3857342253e9e": "5f6f1aebeee4c4aa3bbd07e68f1415d5",
".git/objects/38/2f93b24d93619b06705f8e7c79e0f171ec8c2e": "a4a52cfe909fdcaab128e719d9f45da0",
".git/objects/39/f89fa937a63a53891a1cf88f95e76eb8305cda": "f3c04ffbcf83bd7594ea40d322e5b20c",
".git/objects/3a/bf18c41c58c933308c244a875bf383856e103e": "30790d31a35e3622fd7b3849c9bf1894",
".git/objects/3a/d454d845e010e12823601cad6ecd199245f664": "e1e4cbb88aff00ff259a67a0fcc49afa",
".git/objects/3f/8a3133c34eb2878fe4ee987716eeab02811b68": "85b91f410a64efbdb2100194755e35be",
".git/objects/40/456f7aa85ffc7e08eecaed7377c174e8ca8240": "a736fc0c1d16b7757cf6180cb43f71c2",
".git/objects/45/d042e07b7fad35302d9b80a596ef3f761459f6": "165ad1025d667bc377484134f1eea5f3",
".git/objects/4c/2254beb5d80a2640459443bf420c6753cce835": "96212527b46bd2694336d52b8feb30f2",
".git/objects/4e/8ce71135e77db2290de13d848c94d2849af073": "b6814225154dd2d33f3fefd9d0adcd87",
".git/objects/4f/6b38cab1b7ca2ffdb6beddf6f5c7aa221c1d24": "78721b6be7743cf22a2e58b35000ecb5",
".git/objects/59/b0b3eb36994c85ed82a6b069e91b7653cb9792": "f26287db8878068a889c1043340e3b99",
".git/objects/5e/ccec3a5f79d8f06fe5f9a02242bddde5acba4a": "822819be618585002b89f0ad0b148fe9",
".git/objects/61/14d475117b165d62081146d25d7a18dadc2be4": "ac33b26e6d78f961f8d4e8f06560b47c",
".git/objects/63/6931bcaa0ab4c3ff63c22d54be8c048340177b": "8cc9c6021cbd64a862e0e47758619fb7",
".git/objects/64/2eb881784ba20aa7fd6372e0410b039df6f491": "f579bff446f99f9489a15b4e87bab693",
".git/objects/66/9f535392d7784b6ea70053064f94e529b617bc": "c2d0a513136cb9004204a5fa508b1452",
".git/objects/68/4167b81e2e373d9f10c3f11a8fdc288840beb0": "cf91ceeaa102f962b764209ce3eba757",
".git/objects/6d/5f0fdc7ccbdf7d01fc607eb818f81a0165627e": "2b2403c52cb620129b4bbc62f12abd57",
".git/objects/6d/84cedebc90b5d539b29e508af10d3d363b4763": "a1ee863b1a499f4932e1352517c192ba",
".git/objects/6f/148fbb7e8e929b78983c667279f5938db57e0c": "46cde962a7a486706fa8d9be04565a75",
".git/objects/73/185a6d85f0710fddedf3c4b655b76d725ffd5b": "ae40f9dce1b64a4bd07fbb85f99ba9f8",
".git/objects/73/7f149c855c9ccd61a5e24ce64783eaf921c709": "1d813736c393435d016c1bfc46a6a3a6",
".git/objects/76/e165e2591c3c8a47afaf6300816b7a472cfcb4": "2088bcf0071edd41e2cc3ee93aead899",
".git/objects/7b/1abcddb21b4c8ea552e2d200c4fb6f8bc01758": "732cf347eb5739351637a50236df8919",
".git/objects/7f/1230091155c0b7b953d674220b4358cf07266b": "72ca37b6127bcd5a023c8e63fcff0e12",
".git/objects/7f/90b7e98f392202d951b1fb8feecf18bf052528": "28a5a5513e4946f13b9f6041bd914fac",
".git/objects/85/528cf8a8763686ab697eeaa27f6cb7a52c5710": "4e2050260cef147dcf431f4528317e7b",
".git/objects/87/4889180920d60ff9ef380684f782b26fcedd4b": "f99fc282185002f7a69d4b936cb8f0b5",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/89/919a69b32c1874690975bedc87a0cf871e2f48": "ed38c5d1f795640ef2f21f20f04c7e60",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8b/14e1b15d8e9e3c1bbd598d5c8523820429876b": "871474f798e4c51bc4fadc5092a4fa35",
".git/objects/8b/58718fbb401c9cb3c570dd98793b5028a984f5": "fc62aafb14098ddff81e015fdc778f2e",
".git/objects/8c/59773bee8314a8ffb4431593d0fb49f52e34c6": "2eb993d30677573ffd0e58484cc6a514",
".git/objects/94/e718a44a8206030608b9472f2abd6cb26ab49a": "dd54e1f8f6bad33d57b282ab085fbffe",
".git/objects/97/8a4d89de1d1e20408919ec3f54f9bba275d66f": "dbaa9c6711faa6123b43ef2573bc1457",
".git/objects/97/9447548fdb41ffefb3175d7b8f27a01e49be75": "41431705798afa175bb1f8580a775ba2",
".git/objects/99/f77fd6d9941fff097565540ee1b43be532ae0a": "92b2cf42aab78ade7c74a4bc59d67e31",
".git/objects/9c/04ab712764bfb6f2a074efd7ab51f1cc76d530": "e6ab605e5746a086a86537b54729e8f7",
".git/objects/a1/437e6e09277d488c8c038753184fa3b85f8787": "0b6557c8f596c0f8c457a4f1a663abae",
".git/objects/a3/ca4d69ec13ced47ba006177ab23038358da052": "67ebb1589633b46a93382259d294dabc",
".git/objects/a4/b80210f97d112d785a890dc500ee273390a8b4": "4ded58d5f223489fe52aceee6450b425",
".git/objects/a9/a6742aabc0c7df5b91ead5f233984271f449cf": "82b7db899e3b4532e8d97110f707706c",
".git/objects/aa/a591c3453b1c3d176538b292c102b527ee4d96": "60f2a1f3dbd92e97e31a9f236105bdbb",
".git/objects/af/31ef4d98c006d9ada76f407195ad20570cc8e1": "a9d4d1360c77d67b4bb052383a3bdfd9",
".git/objects/b1/5ad935a6a00c2433c7fadad53602c1d0324365": "8f96f41fe1f2721c9e97d75caa004410",
".git/objects/b1/afd5429fbe3cc7a88b89f454006eb7b018849a": "e4c2e016668208ba57348269fcb46d7b",
".git/objects/b1/bbdb03e837b84de201ced6eeaded64f642b11d": "944097d340cd2e2f245a82056b067a11",
".git/objects/b3/9c4bfccf495d234097ca9180f23154f5484fab": "cb5202854d6c9706fec12edfc2295438",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/bb/d3871afb2f84590ecfed9fc86a498b333e8eb6": "8eca2a8710e23317ede2b9319206d1d6",
".git/objects/bb/fe3f374705e26a0f8ca543295b68d73f918e61": "45918b8bf9ac485f67e49214bee51be5",
".git/objects/bf/d4614eeb189ae048acb4b8e0229565484524f0": "7478ce2b024ac80b551ba42f64e863f1",
".git/objects/c3/6777d380f8d36baef4b0a5e964d3c205e244d5": "9fd487a0244d42f02cc112244839c227",
".git/objects/c3/e81f822689e3b8c05262eec63e4769e0dea74c": "8c6432dca0ea3fdc0d215dcc05d00a66",
".git/objects/c6/06caa16378473a4bb9e8807b6f43e69acf30ad": "ed187e1b169337b5fbbce611844136c6",
".git/objects/c9/528e973fcb9068fab9d52ee6008905d648c60c": "5660d582952236b9b68849bb093ce8bd",
".git/objects/c9/d5c11a85bda16f2c3f30646c59f9d959696dfb": "bf9d5e2db4844ef79ba4c0fa6e2007a0",
".git/objects/cf/180bcbfe416d224ec914d0fbd41a989678d0f1": "a75300793eae77d9a6605a6d13206252",
".git/objects/d1/39926f4158614a8e4db62b5339fc8d9c4b504c": "20f9509452c636807559a2f1148fc94e",
".git/objects/d2/e3e528575fc776cfce357338cc6f43e0f5bc07": "40fbdc7a2ec288d98a06b041f0d68788",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d4/89293c545d2f228bee7d8244875b0680872688": "d0f16883e15e18922d5abeb61503631f",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d9/18f6f718923e9caaff5f9dc5fd38adc0d15a65": "6bda71b97ff1b1be9eb83bc66661c50c",
".git/objects/d9/8cd3145ba50d69b2bc554f1ffdf20c94a1fd55": "074ae708c02bcb5a6e91f0ffc5efeaf0",
".git/objects/db/bd3a942a7e27ab85f9f5d804e14252ee5cd1bd": "2f59e13c3b5119bad07bd6054b352524",
".git/objects/de/85d5b400e6db170d02f8de89dfc6a70f28eb5b": "cee8b512b0d10f2c6b3442550fa4d331",
".git/objects/e6/73f622a299540ef67a5c69b7bde23ddf404b65": "38b3cc66a447ef75156f76d48f21eea7",
".git/objects/e8/07435ffdc681632aca96438a9a8d891f8592ff": "09c74bfbe99328fc4156e9bce4844332",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/eb/e0f8e0583bafed272f5e5f7c24ca7fbf5f66c4": "fc3a7b969fcb7a80f1a995a190a3e771",
".git/objects/ec/361605e9e785c47c62dd46a67f9c352731226b": "d1eafaea77b21719d7c450bcf18236d6",
".git/objects/ef/6dfbddf2367fd050dacb6bdcef32b880dfda6e": "09fe7351952a5c010774cedfcf3a4c43",
".git/objects/ef/c160c8268bcee0bd7b41933d1e6983b692e67c": "c1bdc73536c31f608c936b1787d19f14",
".git/objects/f1/a5f1b64d634940cd66d95cf7add7faa2302233": "67f08cac22c763982b5d9eb4a4ef5a2d",
".git/objects/f1/aafd706e8f88613f98c6657ad21d570f91e3fb": "4f60a5160470db4525c7de3867f2a68e",
".git/objects/f1/b196906f02835cfa11e9c71eb1ec9cb695b33e": "e965fb673c510d84d5ff4d40f7e04590",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f2/cf7564ef024d216b0df2f5c2e440f7217ea72b": "3d98d99410bbc4a6cd896302c9447df4",
".git/objects/f4/08de63f885134eea01cebab131f64f7124884b": "8d397cddeb6ebddc039a7f85c29e9f7b",
".git/objects/f4/10557b275ac253ea34aa087cce72b3bec8f8ba": "aa1ba8dcfd379c0acc224be989a83a73",
".git/objects/f7/d2ff414ca04760e0f0911809f2783038c8233d": "63c1c5af885d0f4c5425a26dd167bd57",
".git/objects/fb/b36e25be8e5aa8d6ffd59fee9d2aa3035a0bce": "a7ee9f5aa926bb163b12a9fe26cabb1f",
".git/objects/fc/27f4c7b96d5317b77c6c28a0fc64ed74cbe975": "256d0ea0d6e2ae27f9c7dcb329d0028a",
".git/refs/heads/gh-pages": "147efc243245eb9addb1f0fd38d78633",
".git/refs/remotes/origin/gh-pages": "147efc243245eb9addb1f0fd38d78633",
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
"flutter_bootstrap.js": "f18fdcc9a00f6599a67fab9317f4c6d6",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "fc6a3a7bc363c9ea13052bbf41441553",
"/": "fc6a3a7bc363c9ea13052bbf41441553",
"main.dart.js": "62d5741a8ebad7c27cf391f8df3a990e",
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
