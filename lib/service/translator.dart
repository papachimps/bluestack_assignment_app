import 'package:get/get.dart';

class CustomTranslator extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        // 'en_US': {
        //   'Recommended for you': 'Hello World',
        // },
        'ja_JP': {
          'Recommended for you': 'あなたにおすすめ',
          'Tournaments Played': 'プレーしたトーナメント',
          'Tournaments Won': 'トーナメントが勝ちました',
          'Winning Percentage': '勝率',
          'Elo Rating': 'イロレーティング',
          'UserID': 'ユーザーID',
          'Min 3 characters': '最小3文字',
          'Password': 'パスワード',
          'Log In': 'ログインする',
          'Error': 'エラー',
          'Authentication failed! Incorrect credentials.':
              '認証に失敗しました！クレデンシャルが正しくありません。',
          'Invalid credentials! Please input valid credentials.':
              '無効な資格情報！有効なクレデンシャルを入力してください。',
          // '': '',
        }
      };
}
