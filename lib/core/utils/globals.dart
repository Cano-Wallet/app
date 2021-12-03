import 'package:znn_sdk_dart/znn_sdk_dart.dart';

// APP
const kAppName = 'Cano';
const kAppDescription =
    'A 3rd party & cross-platform wallet\nfor Zenon Network'; // TODO: localize
const kAppWebsiteUrl = 'https://canowallet.app';
const kAppGithubUrl = 'https://github.com/Cano-Wallet/app';
const kAppTwitterUrl = 'https://twitter.com/cano_wallet';
const kAppFacebookUrl = 'https://facebook.com/cano.wallet';
const kAppInstagramUrl = 'https://instagram.com/cano_wallet';
const kAppEmail = 'support@canowallet.app'; // TODO: setup custom email

// DEVELOPER
const kDeveloperName = 'Oliver Martinez';
const kDeveloperTwitterHandle = '@nemoryoliver';
const kDeveloperTwitterUrl = 'https://twitter.com/nemoryoliver';

// ZENON
const kZenonSDKUrl = 'https://pub.dev/packages/znn_sdk_dart';
const kZenonTwitterUrl = 'https://twitter.com/zenon_network';
const kZenonMediumUrl = 'https://medium.com/@zenon.network';
const kZenonTelegramUrl = 'https://t.me/zenonnetwork';
const kZenonCommunityTelegramUrl = 'https://t.me/joinchat/sImVGqlVQSpkNTBk';
const kZenonGithubUrl = 'https://github.com/zenonnetwork';
const kZenonBitcoinTalkUrl =
    'https://bitcointalk.org/index.php?topic=5279643.msg55303681#msg55303681';
const kZenonDiscordUrl = 'https://discord.com/invite/XDDjECy';
const kZenonYouTubeUrl =
    'https://www.youtube.com/channel/UCDb8ZtqBt6l5l4HugCnJwhQ';
const kZenonWikiUrl = 'https://zenon.wiki/';
const kZenonTestnetExplorerUrl = 'https://explorer.znn.space/';
const kZenonLegacyExplorerUrl = 'https://explore.zenon.network/';

// TEST
const kTestPassword = '1#TestPassword#1';

// DONATION ADDRESS
final communityFundAddress =
    Address.parse('z1qp2zgv2869qw6yat4xppux7vryjfj4henf3uwa');

final developerFundAddress =
    Address.parse('z1qpjzv9humm37lk0wkq5l4m2vcpmxuwgtxn5fs2');

// variable to hold current address - temporary
Address? viewingAddress;
