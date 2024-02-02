## APIs

### Email and Password Authentication

`POST` `/auth/login`

| Item        | Description            |
| ----------- | ---------------------- |
| Permissions | `Guest`                |
| Auth        | `username`, `password` |

**Response:**

```json
{
	"token": "ey...",
	"user": {
		"user_id": 1,
		"account": "tuic@gov.taipei",
		"name": "Taipei",
		"is_active": {
			"Bool": true,
			"Valid": true
		},
		"is_whitelist": {
			"Bool": false,
			"Valid": true
		},
		"is_blacked": {
			"Bool": false,
			"Valid": true
		},
		"expired_at": null,
		"created_at": "2024-01-22T09:48:21.717122+08:00",
		"login_at": "2024-02-02T09:06:52.622091+08:00",
		"roles": [
			{
				"role_id": 1,
				"role_name": "admin"
			}
		],
		"groups": [
			{
				"group_id": 2,
				"group_name": "employee"
			}
		]
	}
}
```

### TaipeiPass Authentication

> **w01**
> TaipeiPass authentication is not available for external developers.

`GET` `/auth/callback`

| Item         | Description                                             |
| ------------ | ------------------------------------------------------- |
| Permissions  | `Guest`                                                 |
| Query Params | `code` 6 digit code that the Taipei Pass server returns |

**Response:**

Same as the response of Email and Password Authentication.

## Middlewares

### ValidateJWT

Validate the JWT token in the request header and set the user information (`accountType`, `accountID`, `roles`, `groups`, `expiresAt`) to the context.

### LimitRequestTo

Limit the request to the specified role or group. 1: Admin, 2: User.
