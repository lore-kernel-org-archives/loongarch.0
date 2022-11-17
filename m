Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A097F290A
	for <loongarch@lists.linux.dev>; Thu, 17 Nov 2022 20:32:15 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id bs21so5777499wrb.4
        for <loongarch@lists.linux.dev>; Thu, 17 Nov 2022 12:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KAff0Xlz8mWBVlgCkTcYKS/p/K9JolaF11dEkGeWag=;
        b=bDkFA7STPepQmV8alfe1swqCWUSF0eDb76Hdaidd9F2ImGptrI/fJLHD/D9sJ1sNhI
         iVNqup/p7xrU1yhVvwN43Q22BPu9Hd1oc32rWOj52tPQ7KnzhUUh4CtgYd3ZDVf2LuOO
         RB/r4hq8TaDQshljnUfxdsxyz9diZGbkdrdQr5drbL6cu41NIXmuc03kHB+E3OniRWor
         dIpOcsygToL0AJWY9XIdUQTMbSwWWZ6S760gsFECcJ5+OgY2WGfY+rW37xeBcyJ9R7Ug
         DF+N9YT7YY3+1O8fBwOWIbBRtdQY2twGV+Dhq5X2G9BeI0Xr+zpMalh6TvRbvD7apu7h
         0Ynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1KAff0Xlz8mWBVlgCkTcYKS/p/K9JolaF11dEkGeWag=;
        b=Pr4rszqw8bMLEf1xtIoQqdt9yTCwhMTfF1gW6tg+cWZ1x5hWY6ACtVxmhcYAwvI9jt
         L2jU7EkzvylcEUZXo9C2YEahrL+U1IqICGvPpc4LCnWkXjOHgIqa2TNTxG6xTxt4RtvA
         AIMGUutebg9//bgFV52M8LtrjMkiubgQ4OCmhUt4q+IydMa6EWkYtKAK3sJtK7liDIAB
         3I8HaH4wlWbdKeJh2z57jL5La/IE7qe7sZrKqWtJxW1XuZWHPamXW/mEUllGIswH25lt
         5L7AC4JZ8DMm1Iz3WTMSfX3Ptw6OwwRSezUukmlwnAKpuJSDvEV2bh8gk32atPOcsUTH
         +Bsw==
X-Gm-Message-State: ANoB5pkLiaMTdwEflgbR8sTMMFp9dKuWoTWT1Gks3Q1tpyDEiYwzU/60
	xRSAkyaIF86j+Z8vIEl7HKJa9DOMPmg=
X-Google-Smtp-Source: AA0mqf56Pgl3Jbnwhpk/Zzh5T2wohCJS3XJu3/T+zUFHTch9J/A9mjtr4nGndcpoR3k381KhYQ6BXw==
X-Received: by 2002:adf:f68b:0:b0:236:6457:ebe with SMTP id v11-20020adff68b000000b0023664570ebemr2580097wrp.538.1668717133937;
        Thu, 17 Nov 2022 12:32:13 -0800 (PST)
Received: from [192.168.0.160] ([170.253.36.171])
        by smtp.gmail.com with ESMTPSA id fn25-20020a05600c689900b003cf78aafdd7sm2186189wmb.39.2022.11.17.12.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 12:32:13 -0800 (PST)
Message-ID: <3d23efbc-b097-69ed-0f24-3a78425227de@gmail.com>
Date: Thu, 17 Nov 2022 21:32:11 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: Ping: [PATCH] syscall.2: add loongarch
Content-Language: en-US
To: Xi Ruoyao <xry111@xry111.site>, Alejandro Colomar <alx@kernel.org>,
 Michael Kerrisk <mtk.manpages@gmail.com>
Cc: linux-man@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 Wang Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
References: <20221105021514.8344-1-xry111@xry111.site>
 <3412acd8ea2f0f3ace22ae7a88b1782fca66aa39.camel@xry111.site>
From: Alejandro Colomar <alx.manpages@gmail.com>
In-Reply-To: <3412acd8ea2f0f3ace22ae7a88b1782fca66aa39.camel@xry111.site>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------R990mIT0t840eBmeKdF70cK8"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------R990mIT0t840eBmeKdF70cK8
Content-Type: multipart/mixed; boundary="------------0eXscRkuRlbkaze40zTztMJs";
 protected-headers="v1"
From: Alejandro Colomar <alx.manpages@gmail.com>
To: Xi Ruoyao <xry111@xry111.site>, Alejandro Colomar <alx@kernel.org>,
 Michael Kerrisk <mtk.manpages@gmail.com>
Cc: linux-man@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 Wang Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Message-ID: <3d23efbc-b097-69ed-0f24-3a78425227de@gmail.com>
Subject: Re: Ping: [PATCH] syscall.2: add loongarch
References: <20221105021514.8344-1-xry111@xry111.site>
 <3412acd8ea2f0f3ace22ae7a88b1782fca66aa39.camel@xry111.site>
In-Reply-To: <3412acd8ea2f0f3ace22ae7a88b1782fca66aa39.camel@xry111.site>

--------------0eXscRkuRlbkaze40zTztMJs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgWGksDQoNCk9uIDExLzE0LzIyIDE4OjQwLCBYaSBSdW95YW8gd3JvdGU6DQo+IEdlbnRs
ZSBQaW5nIDopLg0KDQpUaGFua3MhIDopDQoNCj4gDQo+IE9uIFNhdCwgMjAyMi0xMS0wNSBh
dCAxMDoxNSArMDgwMCwgWGkgUnVveWFvIHdyb3RlOg0KPj4gTGluazoNCj4+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xvb25nYXJjaC8xZjM1MzY3OC0zMzk4LWUzMGItMWM4Ny02ZWRi
Mjc4Zjc0ZGJAeGVuMG4ubmFtZS8NCj4+IExpbms6DQo+PiBodHRwczovL3NvdXJjZXdhcmUu
b3JnL2dpdC8/cD1nbGliYy5naXQ7YT1ibG9iO2Y9c3lzZGVwcy91bml4L3N5c3YvbGludXgv
bG9vbmdhcmNoL3N5c2RlcC5oDQo+PiBTaWduZWQtb2ZmLWJ5OiBYaSBSdW95YW8gPHhyeTEx
MUB4cnkxMTEuc2l0ZT4NCg0KUGF0Y2ggYXBwbGllZC4NCg0KQ2hlZXJzLA0KDQpBbGV4DQoN
Cj4+IC0tLQ0KPj4gIMKgbWFuMi9zeXNjYWxsLjIgfCAyICsrDQo+PiAgwqAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL21hbjIvc3lzY2Fs
bC4yIGIvbWFuMi9zeXNjYWxsLjINCj4+IGluZGV4IDFiYWMwYjlkNy4uYTJhZWY2ZDMzIDEw
MDY0NA0KPj4gLS0tIGEvbWFuMi9zeXNjYWxsLjINCj4+ICsrKyBiL21hbjIvc3lzY2FsbC4y
DQo+PiBAQCAtMTc2LDYgKzE3Niw3IEBAIGFybTY0wqDCoMKgwqDCoMKgwqBzdmMgIzDCoMKg
dzjCoMKgwqDCoMKgwqB4MMKgwqDCoMKgwqDCoHgxwqDCoMKgwqDCoMKgLQ0KPj4gIMKgYmxh
Y2tmaW7CoMKgwqDCoMKgwqDCoGV4Y3B0IDB4MMKgwqDCoMKgwqDCoMKgUDDCoMKgwqDCoMKg
wqBSMMKgwqDCoMKgwqDCoC3CoMKgwqDCoMKgwqDCoC0NCj4+ICDCoGkzODbCoMKgwqBpbnQg
JDB4ODDCoMKgwqDCoMKgwqDCoGVheMKgwqDCoMKgwqBlYXjCoMKgwqDCoMKgZWR4wqDCoMKg
wqDCoC0NCj4+ICDCoGlhNjTCoMKgwqBicmVhayAweDEwMDAwMMKgwqByMTXCoMKgwqDCoMKg
cjjCoMKgwqDCoMKgwqByOcKgwqDCoMKgwqDCoHIxMMKgwqDCoMKgwqAxLCA2DQo+PiArbG9v
bmdhcmNowqDCoMKgwqDCoMKgc3lzY2FsbCAwwqDCoMKgwqDCoMKgwqBhN8KgwqDCoMKgwqDC
oGEwwqDCoMKgwqDCoMKgLcKgwqDCoMKgwqDCoMKgLQ0KPj4gIMKgbTY4a8KgwqDCoHRyYXAg
IzDCoGQwwqDCoMKgwqDCoMKgZDDCoMKgwqDCoMKgwqAtwqDCoMKgwqDCoMKgwqAtDQo+PiAg
wqBtaWNyb2JsYXplwqDCoMKgwqDCoGJya2kgcjE0LDjCoMKgwqDCoMKgwqByMTLCoMKgwqDC
oMKgcjPCoMKgwqDCoMKgwqAtwqDCoMKgwqDCoMKgwqAtDQo+PiAgwqBtaXBzwqDCoMKgc3lz
Y2FsbMKgdjDCoMKgwqDCoMKgwqB2MMKgwqDCoMKgwqDCoHYxwqDCoMKgwqDCoMKgYTPCoMKg
wqDCoMKgwqAxLCA2DQo+PiBAQCAtMzAxLDYgKzMwMiw3IEBADQo+PiBhcm02NMKgwqDCoMKg
wqDCoMKgeDDCoMKgwqDCoMKgwqB4McKgwqDCoMKgwqDCoHgywqDCoMKgwqDCoMKgeDPCoMKg
wqDCoMKgwqB4NMKgwqDCoMKgwqDCoHg1wqDCoMKgwqDCoMKgLQ0KPj4gIMKgYmxhY2tmaW7C
oMKgwqDCoMKgwqDCoFIwwqDCoMKgwqDCoMKgUjHCoMKgwqDCoMKgwqBSMsKgwqDCoMKgwqDC
oFIzwqDCoMKgwqDCoMKgUjTCoMKgwqDCoMKgwqBSNcKgwqDCoMKgwqDCoC0NCj4+ICDCoGkz
ODbCoMKgwqBlYnjCoMKgwqDCoMKgZWN4wqDCoMKgwqDCoGVkeMKgwqDCoMKgwqBlc2nCoMKg
wqDCoMKgZWRpwqDCoMKgwqDCoGVicMKgwqDCoMKgwqAtDQo+PiAgwqBpYTY0wqDCoMKgb3V0
MMKgwqDCoMKgb3V0McKgwqDCoMKgb3V0MsKgwqDCoMKgb3V0M8KgwqDCoMKgb3V0NMKgwqDC
oMKgb3V0NcKgwqDCoMKgLQ0KPj4gK2xvb25nYXJjaMKgwqDCoMKgwqDCoGEwwqDCoMKgwqDC
oMKgYTHCoMKgwqDCoMKgwqBhMsKgwqDCoMKgwqDCoGEzwqDCoMKgwqDCoMKgYTTCoMKgwqDC
oMKgwqBhNcKgwqDCoMKgwqDCoGE2DQo+PiAgwqBtNjhrwqDCoMKgZDHCoMKgwqDCoMKgwqBk
MsKgwqDCoMKgwqDCoGQzwqDCoMKgwqDCoMKgZDTCoMKgwqDCoMKgwqBkNcKgwqDCoMKgwqDC
oGEwwqDCoMKgwqDCoMKgLQ0KPj4gIMKgbWljcm9ibGF6ZcKgwqDCoMKgwqByNcKgwqDCoMKg
wqDCoHI2wqDCoMKgwqDCoMKgcjfCoMKgwqDCoMKgwqByOMKgwqDCoMKgwqDCoHI5wqDCoMKg
wqDCoMKgcjEwwqDCoMKgwqDCoC0NCj4+ICDCoG1pcHMvbzMywqDCoMKgwqDCoMKgwqBhMMKg
wqDCoMKgwqDCoGExwqDCoMKgwqDCoMKgYTLCoMKgwqDCoMKgwqBhM8KgwqDCoMKgwqDCoC3C
oMKgwqDCoMKgwqDCoC3CoMKgwqDCoMKgwqDCoC0NCj4+ICDCoMKgwqDCoMKgwqDCoDENCj4g
DQoNCi0tIA0KPGh0dHA6Ly93d3cuYWxlamFuZHJvLWNvbG9tYXIuZXMvPg0K

--------------0eXscRkuRlbkaze40zTztMJs--

--------------R990mIT0t840eBmeKdF70cK8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmN2mkwACgkQnowa+77/
2zIMag//bmkAt6tg6/91Nsnvv99IPq7mDFBfmImaL8tHIDnbcpOvw6P+q3WT+CpJ
clXonesUAFA6+r6ci7ZZmfXgcPYxe9SsUP4CQN9SZbRbCSm6zyRlgRvUV1VG623O
Axw2NxAMMWxwvcZy2nZXnYwFho1GhHdMCV5sUM/JnEx64OwibFfYe6iZW98ra7wi
sXSZigQDE8DHYECNLroke9F8VwiWLv6nhXcxL0jxAuDEz9gFo1K4mptogN5NngEq
q2DqF+XvVK5Kew5ODwH8/aDt8f3Ww4WetQe/tQ5lC4qtPi8hGCCWBuNwPQDhrowa
AwPswFk4voP/CDmmMSjiMjWiavziCSIuJfueCPxVT+wJ6aZUfFLlmjQ9QLLOW8dS
xCnAjKa4ImJMZNU31kPjQDTrhbApbZnpdFAljC9SJxpb+EbCiy8jJneyVAuhicAl
8z9MMihSylT4+qHNrT2PM6cVr8X+xkqbtKkz73VY4FCi9zZy0HzbKa9Ss1fNK5bS
IUPWTGSb2Vjlf38nLoSLwdsR6+IDKk2hzTv4KN6T1oNfqirRg1HGBLs6JipO1JBQ
pQ7/aFymCubaJfYVGzacMgL1VDx6PGgsro9915vg9Hidk2Hu6VrSOyOUCXgK9qNZ
6LRaZ2tvA8bVZC2VFOJhpFRadVe4DEEEn6SsMW3kQaE3Tlo60Fo=
=CSS/
-----END PGP SIGNATURE-----

--------------R990mIT0t840eBmeKdF70cK8--
