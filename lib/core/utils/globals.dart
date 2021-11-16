import 'package:flutter/material.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

// PROJECT
const kProjectDescription =
    'A 3rd party & cross-platform wallet\nfor Zenon Network';
const kProjectGithubUrl = 'https://github.com/Cano-Wallet/app';
const kMaxContainerConstraints = BoxConstraints(maxWidth: 500);

// DEVELOPER
const kDeveloperName = 'Oliver Martinez';
const kDeveloperTwitterHandle = '@nemoryoliver';
const kDeveloperTwitterUrl = 'https://twitter.com/nemoryoliver';

// ZENON
const kZenonSDKUrl = 'https://pub.dev/packages/znn_sdk_dart';
const kZenonTwitterUrl = 'https://twitter.com/zenon_network';
const kZenonMediumUrl = 'http://medium.com/@zenon.network';
const kZenonTelegramUrl = 'https://t.me/joinchat/MLyPehLIbJj1nw1XOOOltg';
const kZenonGithubUrl = 'http://github.com/zenonnetwork';
const kZenonBitcoinTalkUrl =
    'https://bitcointalk.org/index.php?topic=5279643.msg55303681#msg55303681';
const kZenonDiscordUrl = 'https://discord.com/invite/XDDjECy';
const kZenonYouTubeUrl =
    'https://www.youtube.com/channel/UCDb8ZtqBt6l5l4HugCnJwhQ';

// TEST
const kTestAddress = 'z1qpjzv9humm37lk0wkq5l4m2vcpmxuwgtxn5fs2';
const kTestMnemonic =
    'inner benefit antique boring oxygen number material skate ivory maple spike stick noise follow guide cause clown speak fortune carpet shy lunch auto indoor';
const kTestPassword = '1#TestPassword#1';

// DONATION ADDRESS
final communityFundAddress =
    Address.parse('z1qp2zgv2869qw6yat4xppux7vryjfj4henf3uwa');

final developerFundAddress =
    Address.parse('z1qpjzv9humm37lk0wkq5l4m2vcpmxuwgtxn5fs2');

// variable to hold current address - temporary
Address? viewingAddress;
