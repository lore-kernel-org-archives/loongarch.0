Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021085.outbound.protection.outlook.com [52.101.95.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FD122B5A3
	for <loongarch@lists.linux.dev>; Tue,  9 Dec 2025 12:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765282633; cv=fail; b=Jm8OAkm5EOxfIq+GJtCofVrJR2D+XUiorg6EOunl/AtFsKtuHB+MIcWh9kl0WQLq5NVBiQ2i7jC23MvK6EzpixB3X7r1owK2nXTUSgUW6VEN6ZlLxUzxNLevFaQc/Jrxt0FDivyC7sgKprUgs5IxwDoqU/vUxPswIVy0X0bdLz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765282633; c=relaxed/simple;
	bh=lQgCs6ewnaB2BWAmIyD4PC2dBcUfm4VB+/noAVKguHU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mf2SN068/dkeAtD1YTr6pJfzptmQSnDe+HnDdl5FBc/tE8H08HTIKAm6Vt/EN64f0HIqhljzWtcnghu5tF7rPicnrTfpoowpmeBHO+FikmDll+xBlJfDySMIMYuKaWgIrNlXtuJeHytFDHtwbPG0VO/AkPjNDBze2+vfrG0Y5R0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=XGSRrHVY; arc=fail smtp.client-ip=52.101.95.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="XGSRrHVY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iuPEKRzFbfonRvFyH0YzK8yYXblGJxgx4eqWDHV5lUL8d4sAmLAIXibBdLXlx9oAASMqLFBslMmeQ8wFwl05AG0KLuWpXh3xG4ZX9H3HstjjywKnN2eRwofkZYNL28UHE/Lid5EsPs8CAn/xGZuv5vxppgABRzmwBWucjyxSp6kH1wykqtr4Z/UcUtugXYT5VOl9mqYVpDQqsZkmoG10UJU4Ex5LN2FDnSoIVBgSNOpuJ0pEImIMmipeDqhguoQQMUWTh5v/bjeJoSx2zLMOcG5Z1q6npWnKFwvcYNFqcUQL6i8IDzYdQ8wIOnSbbIE1To1E8aIMEniwlDTlCT+a5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtUPrLsesvhIInPt7B/Yr9OFZbv0flO6N+JU71evKlc=;
 b=wtR4jlsU7yMQHiFzw4Mt4Y2Gn966Q0AG612uWLsunAivsw3ruXllZPikWjNoJSxVTkR1i3tQPXywLKuSbBjH7eVmaDRK85hQoRgBr1sDlH/bP6TOwABfObP9lV7jPI1SSzZiKUMiaGpu6oAKL7R/vYM3N8TE3Wyb8xIhUBjBXjnlhgWOg1jDCB5DQtBQKzLoblgkkV91Xy+ytQqupd5CJI33XERZAQfrBDwxAGmAZ+JMDF5VdXPhJy9Eydn28r+iyaBPoVDFsfnIZyJP193N2BeTU3+FSJ8mytb0+klQorQfkgLyM/L1xQcn3cTUpfuJ0eLH5Td/IkXrZdMNj2yVcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtUPrLsesvhIInPt7B/Yr9OFZbv0flO6N+JU71evKlc=;
 b=XGSRrHVYF3rySPdBGWI53ROtyA0BcwlD/pd68dKsz+W09IqLp0A4wgazXn1/4+1mwH86GJe0SR55fpjB86wzwfAUuK0XMeA1jy2GlUVrdhH+yC9oQGIHeA4QmifRDxxcKPyiG5thpn2/RLne+t49gaCDA+Vx9oP6adJYIm4Y23g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LOBP265MB8422.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:46e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 12:17:07 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%6]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 12:17:07 +0000
Date: Tue, 9 Dec 2025 12:17:05 +0000
From: Gary Guo <gary@garyguo.net>
To: Xi Ruoyao <xry111@xry111.site>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Huacai Chen 
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Alice Ryhl 
 <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arve =?UTF-8?B?SGrDuG5uZXbDpWc=?=  <arve@android.com>, Todd Kjos
 <tkjos@android.com>, Christian Brauner  <christian@brauner.io>, Carlos
 Llamas <cmllamas@google.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Danilo Krummrich <dakr@kernel.org>, Benno
 Lossin <lossin@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 loongarch@lists.linux.dev, rust-for-linux	
 <rust-for-linux@vger.kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: Re: Mainline loongarch64 defconfig+Rust build error
Message-ID: <20251209121705.7f6c1117.gary@garyguo.net>
In-Reply-To: <fb77069524eec1df222b2ecbc6ddf5c3b4b041bb.camel@xry111.site>
References: <CANiq72mrVzqXnAV=Hy2XBOonLHA6YQgH-ckZoc_h0VBvTGK8rA@mail.gmail.com>
	<fb77069524eec1df222b2ecbc6ddf5c3b4b041bb.camel@xry111.site>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0243.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::14) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LOBP265MB8422:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ed12635-3af7-4b62-831a-08de371cdf01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkhMVmVseGNDMGZGaHRHMDNSSzREWXg5WmhNbzMxNlBOYlp5b2VodW9LaEg0?=
 =?utf-8?B?VHkvT3pZK082RnZicWlEekhYRngwTk1FK0ttL2dENk43bnhWV3JGQlFoTXY1?=
 =?utf-8?B?aXpWSDRhWlRlZ0hnU2c5bGlibDFrdXMvQXJydDNtUStlS05wOGw2cGdJazh5?=
 =?utf-8?B?VWtXRnpMNTlSV2lVYXVEN0tPdDcxMzB4STUycjJ1VXhhamVkYnNNeXZQNWhv?=
 =?utf-8?B?bHd3bjlUVjdIUkJGRlJ6SkFLTnNucmszNS85dVQwMmthRnRqWnFQNDdteWZI?=
 =?utf-8?B?dFhoL0NRRlR2aHR4QVB6aDV0YndjR1Q0WTJBKzVGdFVzYy9IYVA0MnorNEVU?=
 =?utf-8?B?aE84L3FxOEx2bnRLd3BHMm1IMDVxcmhpbE9hSDE2dXpLUWVCM0l3dVJTRlNr?=
 =?utf-8?B?VXZIT2RhZ2JRMUphUzFHeTNVdURMNnlyQnBKMHpkRkQxOVlLSlpEQnF6ZUJB?=
 =?utf-8?B?TGY5S0lVOUtKWVhkZzQ5dWs5TTJwdkxBUmp0OGVzUDVxWG1qVmVRL0VmV2tN?=
 =?utf-8?B?SDlBMFNYd1dDWnFHMlRXVnhNeGZwOXdVN09ZdEh1UlZIRjNJREQwUU9hN2xG?=
 =?utf-8?B?REFkQXBIcmVWTUJnelg1czlSNXpyRzFOcjM0dXUzOTVXVTFFQWlNeU9kMklZ?=
 =?utf-8?B?enR1RG5wbUo5UU5rY3JVcEpDM09GSVNEb2FiaXZjTHRaemNTU0ZRYTl2THZ2?=
 =?utf-8?B?ZUwvUjE0VkFqTjBGOG02TkxZeUNKRE43cHB0YWhITzhrL0dISU1vM2VQeVhv?=
 =?utf-8?B?VjFaNko0VzZZblBXMldSUGlsaFl6V1Z4N05JWElKSjNXT0p3NC8rM2Q0Z1RD?=
 =?utf-8?B?N3RDS2ZiOFNYckczMUxsUzBnL3AvK1NPcVBEc1ZSYmFMejY4UDU5U2Q4SlJB?=
 =?utf-8?B?aythWm16TmxlRFhZUVlBUC80U2M3MGNGc2hTRnMraTF6ZytLU2wxbWs5L0Vh?=
 =?utf-8?B?b3hyejlMNm8vMFpMT3FUSU9rN1c3RUgvc3YxQWRQMTduTnR1ZjVBR0hxTDc5?=
 =?utf-8?B?R2dZQnkycm10Rkt1dTJOVU9DbGltUFFsZHQ5RXcwNSt3aXlrdFhpOURjRktq?=
 =?utf-8?B?blRiQjBnYlg5VlZqc29pOGc4NnovTWdUazBhWjNEWVlVVUdsa0FFVVpaclBV?=
 =?utf-8?B?MlA2L2ZOR0IrdDcyS25kY0pJZ04zUXEwdzA1T2phcUlDREh6NHRBK3F1eThH?=
 =?utf-8?B?RjRwR2tUVHlFN3hEVHZJYzJwWDF6aE42MXZYVjh6dGEzcjBNcnQxOHozeXZk?=
 =?utf-8?B?UzlNWXBxMWZHTWZnSnFIa2ttTjduVDJyWWl2MGZVU09MNG1hQUt2ei9lc3M4?=
 =?utf-8?B?aHpHeFB2RUJSaG4yQVdUbUhiNVI1UmdNYlhaVWdNQ21qUkN6dDVFSU1vU0Fs?=
 =?utf-8?B?cXZzNmszN3VCRVI0dkFHbHhCc3RlV1d1N0NOdVRMaW9Vakt4TjVoWE53bmRw?=
 =?utf-8?B?R3IrWXo1YnQxeWgzVGo5eFR5QjZ0R3dKZ2VOVTdUbWxkaW5hVi9Oc2JZUTRN?=
 =?utf-8?B?VzZVZmllYVBRSThHVnBIQjg3NXg1OWhqZ3hwWjU4cEtHc2hXaDhMbnNIeElv?=
 =?utf-8?B?WGhzMUw2ck9NS2h2SHhBdlAreXVSR25mQ1l6cEN4TStBaHlMZnJMUGsxbUda?=
 =?utf-8?B?TGlpWGlYUHdld1dNeXQzQmMxMEh4QTZTYkt5dnJVWHRhQnBmdWF4M3Y5Y0F6?=
 =?utf-8?B?YUpxUTIrdXpTN0ltcDNxRUZ2MUxnOHU2K1VsaVpFNUEzdXk2ZmIxeHJxMGJq?=
 =?utf-8?B?cFBSL3JWWGRsd211UVlsa0FGYkJzOXpyZmVOTTBlbU5DTDF4ZU9xZGovMHN1?=
 =?utf-8?B?S1R3YzRyT25WcWRBYkw5YWExVUNlVlFNMUJ2MUtuakpZemc0azBsZW5IR2gy?=
 =?utf-8?B?ZTBmUW1BWVhYOFBocG9SR0xtOVlsZjJNd3dnbGxnVDNDS0txRXJZSXJNU09M?=
 =?utf-8?Q?uX1OFsm9B+wOOl/lLNYWF3FyzsZQZopx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDlvaHNtRTVHc3hCbC9DMG41dmhhTG9GbEhvUnpoM1hjWVVOYzZMK3JVeng0?=
 =?utf-8?B?WFNTUlRwNkt3SFZ2eS9ZR0hzTDM4cWVNME84RlgxUTV5OXl6S1VsY0VMYXBI?=
 =?utf-8?B?ZjlHTnRNRlM0S0I5SlhvY1kwajd4Rzdxcy9TMW4zbzFxV0tKMkd1R0lSUkdC?=
 =?utf-8?B?Qy9aWm1SSGh2dlplNUNiS3k5c04xWG52cjJSNWpoRlUwTEhHb3hVaWw3MXlz?=
 =?utf-8?B?MUFIQzZ6QmFNUlBZM05qYS8xTm9zNHh4SXVZWWxNVzU4OFNmNEJydFlhbUNx?=
 =?utf-8?B?N0xvcUM2VUQzbTA5SlkweDRXM0NENjIvcEFNYTN6dnBTK3pGcXQ2dmRJY0RR?=
 =?utf-8?B?R3gyd2kzck5WMUphZzkxZ2ZvN0g1QW1oTlhyaTM5cTBOQ0V4bEIwMEhYN21G?=
 =?utf-8?B?ZlRMTGxZVWhjYXJTVEhaZEIzc205bWdvY0dTSUlmQjZ1bUo5Zm42UTVVWldP?=
 =?utf-8?B?Vml4NUZNSVM2WFFhRTEvb0xGV2J1anZYeWxwcmtCS1RnTzg1MnBWSkMveFBk?=
 =?utf-8?B?Nm1uNnhROXUyREJsbUNHY3l6UGtacUxETlp3SVJPd2dzWWpZZ21iMlJ6QWNP?=
 =?utf-8?B?UlRTUGIyakxZQWs4N3pFU2RkUklBeGkyeVg5WXExdHVvUGhvTE0yZlJzOHg4?=
 =?utf-8?B?cTZPYnRmUmRZV3dRcDhPdnpZSk5PYzRVOENGV2EySGE1dWtrekpTQjFIcHFv?=
 =?utf-8?B?S2k4Q0xVTzc3cEVtUTU2Q0NFREZPZ0pUTWlMb2JDR3ZPMHlYTXAzTHFkOXpI?=
 =?utf-8?B?eDVoNTVVakdGQ1d1QnpoSzJYRWlIMDh3RE9MNE93ME1Pek9hazBoK1BLUmRD?=
 =?utf-8?B?eXVnYm9yZ252UWRscDc1VmtrbWZBZ28vbytTQjFQbHJUNTBRSVJ5UnpMQytU?=
 =?utf-8?B?aDhQTEJNZlI2VG1ya3IxcmJteE1qQ2VzbEw4d2JxVEUyUEFyRUdOdU1xWDhI?=
 =?utf-8?B?aHh2TGNJYVdaQ3dWcmdLODF6YW40dk5jWnZmM21yeFkzYS9Ld0tNdG9yNlM4?=
 =?utf-8?B?dHM4RDA4RzR3cElCVWRDYVh1bUo4SUhrT3FLUmx5bTJpOGhlVWhVdSt3NXZ1?=
 =?utf-8?B?LzRNaGU3Z0lIZHB1elo3RzFuL1JIMkdyYWhac3dXMkJRQ29reXl0UnRqNzdB?=
 =?utf-8?B?YmxRb29BSVdhUHpQV1piRkZrSHMzMzVCTmZUQXhKMjcrSWtIdDNZWUkwY0Yv?=
 =?utf-8?B?VCtWUGJwNzlkalhvei9NSURsR1Vxa1diQ2xrQ2ExcndjME9BNGNZdGpWdlV1?=
 =?utf-8?B?VXFRQ0QwaHZFc0gvUUhlbjFoWWtXY25Db1doYU1RUVhXQzBGWkd6bmQrM0Rp?=
 =?utf-8?B?TktLSElmamRmMW1UalIyZTRaTlUxQ05hYkp4azlzbG1SQkVYRFFyMjVNS1oz?=
 =?utf-8?B?aStBMFVwRlYyOTFsVkQxS3NxMVFMSHdkZGt4Y3NLYnEwcFRCd01EL1FpcjY4?=
 =?utf-8?B?OERrR1pwU0M5clhQbTdBQjZNa0d5UzJjYnJNcnZXRVJ5dXpTci90dFV6Z3N6?=
 =?utf-8?B?bTgzTHU4NnhHT2V5WGZiNU9zV3ZQKzhwWk1pc1hGN1BGZG9KRHRmNjd2cFRY?=
 =?utf-8?B?cHl6eVdXWDVyeGgrTzZ0ZlBhdUg5aWMycXRaUjVVcGl4WWhWNmZLcjVTNzR4?=
 =?utf-8?B?UmJvSXR0NDZMRGdYRUNMVk1yZG9SdHV4eS80Y0JsVUg4R2FvOStFWnRmY2VB?=
 =?utf-8?B?MWp1Q0NLQ1drUlE1WlEzM2pKbTVZbTRYcUx1aFhBWnhDemM2cGlGenlQY0ow?=
 =?utf-8?B?dUxjVzFDdExnakxXWWxqVFZuejNjVFI5N2JRZFoxcVJudmUwSzRZOEw1bWtj?=
 =?utf-8?B?R2N3ckZTbGZzT21aZjM4c25zL2NwNE5LZUZnbFJpSEFaSEJORDFQTUFCMmpK?=
 =?utf-8?B?cnJYTGR0c2N0VElDZkhpeE9vcUZOc0NjK000eFhBK1ROWGxJNk9QcGxBcVlk?=
 =?utf-8?B?cUtvWlJ4Q1gybzNZcGJ4MDRWZnZXY2w3S3hIcDRqNWpKTUVrSFI5ZVBGM0hV?=
 =?utf-8?B?SGNoa1dydjFuRGVwcUltMTB3ZUl4SGlkdXFhK3RESmNxRkpFWnBXeUdsWWpV?=
 =?utf-8?B?dmJUWS96RHd3MXVyU3lwMHdTYkVpSHRxOTBpTGFYYjViTjhDRE5PQnd2eG8w?=
 =?utf-8?B?cGV4SGlxckNPbTJVOUZzTlpxa2JabFZzZzl5V2tDOU41TFVFa3FKN0x4N2lS?=
 =?utf-8?B?TUE9PQ==?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed12635-3af7-4b62-831a-08de371cdf01
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 12:17:07.4272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+J1y4pZILsIdxiMaMT5dNEE2o3DeHyjLafUgLa0TKpqCF3OnM4gsBZOk8+x7Id+AyzunSIxTCLCh7E633TpBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB8422

On Tue, 09 Dec 2025 19:28:33 +0800
Xi Ruoyao <xry111@xry111.site> wrote:

> On Tue, 2025-12-09 at 11:56 +0100, Miguel Ojeda wrote:
> > Hi all,
> >=20
> > I am seeing in mainline loongarch64 defconfig+Rust the following build
> > error [1].
> >=20
> > Cheers,
> > Miguel
> >=20
> > [1]
> >=20
> > =C2=A0error[E0425]: cannot find value `compat_ptr_ioctl` in crate `bind=
ings`
> > =C2=A0=C2=A0=C2=A0=C2=A0 --> drivers/android/binder/rust_binder_main.rs=
:317:38
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > 317=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compa=
t_ioctl: Some(bindings::compat_ptr_ioctl),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^^^ help: a
> > function with a similar name exists: `compat_sys_ioctl`
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > =C2=A0=C2=A0=C2=A0=C2=A0 ::: /__w/quick/quick/linux/rust/bindings/bindi=
ngs_generated.rs:78264:5
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > 78264 |=C2=A0=C2=A0=C2=A0=C2=A0 pub fn compat_sys_ioctl(fd: ffi::c_uint=
, cmd: ffi::c_uint,
> > arg: compat_ulong_t) -> ffi::c_long;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 --------------=
---------------------------------------------------------------------------=
-----
> > similarly named function `compat_sys_ioctl` defined here =20
>=20
> I highly doubt if this is really a LoongArch-only issue.  We have:
>=20
> #ifdef CONFIG_COMPAT
> extern long compat_ptr_ioctl(struct file *file, unsigned int cmd,=20
>                     unsigned long arg);
> #else
> #define compat_ptr_ioctl NULL
> #endif
>=20
> AFAIK bindgen does not translate C preprocessor macro definitions, so
> when !CONFIG_COMPAT we won't have the Rust binding for it.
>=20
> And as LA32 is not upstreamed it's pointless to support COMPAT for
> LoongArch, yet.
>=20

I think bindgen can't handle this on its own anyway, as it doesn't
really know that you want a `Option<fn(..) -> ...>` type here instead
of just a function item.

Probably the best way is for each user of this function handle
CFG_COMPAT on its own for now. Alternatively, we can just provide a
helper that just returns `-ENONIOCTLCMD` instead of using NULL?

Besat,
Gary
