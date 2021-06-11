<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>
<body>
    <div>
        <p>
        【通知メール内容テンプレート】
        </p>
        <p>
        ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        </p>
        <p>
        このメールは送信専用です。返信することはできません。
        </p>
        <p>
        ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        </p>
        <p>
        整理番号 : 〇〇〇〇
        </p>
        <p>
        {{ $user_name }} 様
        </p>
        <p>
        新規メッセージが有りますのでご確認ください。
        </p>
        <p>
        返信のメッセージは、以下のリンクにアクセスして行ってください。
        </p>
        <p>
        https://xxxxxx.com/xxxxx/nquiries
        </p>

        <p>
        以下が{{ $admin_name }}からのメッセージです。
        </p>

        <p>
        —————{{ $messages }}—————
        </p>
        
        <p>
        * 本メールは送信専用メールアドレスから配信されており、
        </p>
        <p>
        ご返信いただいても、内容を確認できませんので予めご了承ください。
        </p>
        <p>
        * 本メールに心当たりの無い場合や、ご意見ご質問等は下記へご連絡下さい。
        </p>
        <p>
        〇〇サポートチーム
        </p>
        <p>
        support@〇〇.com
        </p>
    </div>
</body>
</html>