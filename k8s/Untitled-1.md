curl -X POST http://a1b174ef483244e3e9a2845c89d67432-bf9e33b28cae2c49.elb.us-east-1.amazonaws.com/admin/keys \
-H "Content-Type: application/json" \
-H "Authorization: Bearer admin-secreto-123" \
-d '{"name": "nova-chave"}'


curl http://a1b174ef483244e3e9a2845c89d67432-bf9e33b28cae2c49.elb.us-east-1.amazonaws.com/validate \
-H "Authorization: Bearer tm_key_8fd7b20873d804662daad10ad39ae6e3100946062201fce567e5fd36310848b9"


curl -X POST http://a1b174ef483244e3e9a2845c89d67432-bf9e33b28cae2c49.elb.us-east-1.amazonaws.com/flags \
-H "Content-Type: application/json" \
-H "Authorization: Bearer tm_key_8fd7b20873d804662daad10ad39ae6e3100946062201fce567e5fd36310848b9" \
-d '{
    "name": "enable-new-dashboard",
    "description": "Ativa o novo dashboard para usuários",
    "is_enabled": true
}'

curl http://a1b174ef483244e3e9a2845c89d67432-bf9e33b28cae2c49.elb.us-east-1.amazonaws.com/flags \
-H "Authorization: Bearer tm_key_8fd7b20873d804662daad10ad39ae6e3100946062201fce567e5fd36310848b9"

curl -X POST http://a1b174ef483244e3e9a2845c89d67432-bf9e33b28cae2c49.elb.us-east-1.amazonaws.com/rules \
-H "Content-Type: application/json" \
-H "Authorization: Bearer tm_key_8fd7b20873d804662daad10ad39ae6e3100946062201fce567e5fd36310848b9" \
-d '{
    "flag_name": "enable-new-dashboard",
    "is_enabled": true,
    "rules": {
        "type": "PERCENTAGE",
        "value": 75
    }
}'

curl "http://a1b174ef483244e3e9a2845c89d67432-bf9e33b28cae2c49.elb.us-east-1.amazonaws.com/evaluate?user_id=user-123&flag_name=enable-new-dashboard"


curl "http://a1b174ef483244e3e9a2845c89d67432-bf9e33b28cae2c49.elb.us-east-1.amazonaws.com/evaluate?user_id=user-abc&flag_name=enable-new-dashboard"

curl "http://a1b174ef483244e3e9a2845c89d67432-bf9e33b28cae2c49.elb.us-east-1.amazonaws.com/evaluate?user_id=test-user-1&flag_name=enable-new-dashboard"