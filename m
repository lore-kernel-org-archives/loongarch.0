Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0C627A448
	for <loongarch@lists.linux.dev>; Thu, 28 Aug 2025 06:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756363492; cv=none; b=U/20Qw00VMmM5xvoTBvr7vcKyF3CsyHAU7xliRoWQlDBK588V14Xqe2x0pns/kJ5L1Ha5C/k77GHUD329mElx8CtjY7gw6Pa80CcFqfff38eGBbu8lNWooMDtcSNc4VPpUk5wasjJKsPoHlDD+7K76xMcwu0oVBVNZXMd6h0mr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756363492; c=relaxed/simple;
	bh=RwxnirQWhb3v7GeuZRE6t7kyeqE446HPGv8NzCkDJXw=;
	h=From:To:Cc:Subject:Mime-Version:Content-Type:Date:Message-ID:
	 References:In-Reply-To; b=i6FvLwdj3GM5JUwa6zdk0UaHxWVwaW6osVY4ijANlOITku76rN9mPOEEmxqTqC/u9s976fj7JBTUHbniBfIqTA6qq5xuXBXRyT+TtGmJhv6aSykrWq/+QvBq/YUvQqOXS+uoyn6RXrKGs4Un6c2FDI+9wQdavmxRf9k+3v061Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=IxWiS6NV; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="IxWiS6NV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1756363470;
	bh=RwxnirQWhb3v7GeuZRE6t7kyeqE446HPGv8NzCkDJXw=;
	h=From:To:Subject:Mime-Version:Date:Message-ID;
	b=IxWiS6NVKlz0bCIzzj+Yz7XxwUBidLbLyHUT8DXdydranpCjlTzC5DEAHN+ot9yiw
	 GvV/fnC5rFMUjTx9tb0XUdciLUQDDx5N70IlOY+MtTkcPTKxpZZCBCdSkGtsUIUscu
	 q0iRXEa0HcEOGWA0S/M9cihmF2nmvuQkYo6yxnis=
EX-QQ-RecipientCnt: 7
X-QQ-GoodBg: 1
X-QQ-SSF: 00400000000000F0
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-FEAT: D4aqtcRDiqST8P4pfj07qGG6ZowgZlQrBrKFg+dHp6U=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: Kw7K0yF6b6Hx3NLKvB8+5aMahLGjEHXYdm8zYbH2IOm2TtkGq2+2QZByz9TVy1D8uoOKO6TKN4z31/+UbMYxGQ==
X-QQ-STYLE: 
X-QQ-mid: lv3sz3a-6t1756363466t769ca8d8
From: "=?utf-8?B?V2VudGFvIEd1YW4=?=" <guanwentao@uniontech.com>
To: "=?utf-8?B?WWFudGVuZyBTaQ==?=" <si.yanteng@linux.dev>, "=?utf-8?B?Y2hlbmh1YWNhaQ==?=" <chenhuacai@kernel.org>
Cc: "=?utf-8?B?V0FORyBYdWVydWk=?=" <kernel@xen0n.name>, "=?utf-8?B?WGkgUnVveWFv?=" <xry111@xry111.site>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bG9vbmdhcmNo?=" <loongarch@lists.linux.dev>, "=?utf-8?B?5Y2g5L+K?=" <zhanjun@uniontech.com>
Subject: Re: [PATCH] Loongarch: entry: fix syscall_get_arguments() VS no-bultin-memcpy
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Thu, 28 Aug 2025 14:44:26 +0800
X-Priority: 3
Message-ID: <tencent_0FAF7256085045837A460C9A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20250826113225.406238-1-guanwentao@uniontech.com>
	<a0e11216-71b0-447f-beab-351d024810fb@linux.dev>
In-Reply-To: <a0e11216-71b0-447f-beab-351d024810fb@linux.dev>
X-QQ-ReplyHash: 2877765852
X-BIZMAIL-ID: 2562391891426195890
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Thu, 28 Aug 2025 14:44:27 +0800 (CST)
Feedback-ID: lv:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NFb3Nvufrnbao/B3v6uZuN+ddbXhqwwj/gqUtgMyFr1kMuEwIAqvSNm2
	hmoCbXUfaC4uptZJ7CtQ10YSQ0vu8pzryk51jHyEIDePTptYYDr0Gj6Jp8zgpow0HR35x2Z
	wQi97RUAaZwTeNzmas7ZpSEePu0UJzfOcZkclI5EgzXdkmQb60d9ZrJbx/HlhfXJyAtT6mw
	yaPH8/yEmlf1TW7K4UqP+9E9BJdv/EHdX8LtdohRal9rEpuMUt2eOhmzESFOQDLs1IPyOCI
	hGkbdb9utHnfDflXJRzb8EtzddXRb7Ck1FROlrxJtsJfawRz6yf/GejnkLmEdwMh5cOzAD7
	BDd/9l7zMBLPIveSLEQs81a0ktr8Z7W8cok5TCK0cCMgSAu46q64++zYfxX3GoZXp2u3dFw
	4jffWEsaM73c17VtdY6QT6E7j/o7mH856gJ6SoVCacxUwY3xtAK4ol7bH6g7agLVilz4w2w
	qUmRBdprxaqNDOG8Ckcm1URQ6dVPQ8vfM8LVroliDe0xCqZVDyKte7c/piKqMJ27TThrdJz
	aaAkQvzxcjSUxJ8aVmVvS/Yn1IZVo0I+W/OgXkbhEVQRO0WzqfmbAiB1koJlFWn5KhF23F/
	uQIX8raHqX6Z5D59L5oIoZ3ThAA4sH111pi8qm6dvZS3lQx0qVVXNgp+C0uBjbZEL0/8134
	fKUDf68LC3DVdyVHf/MXv1VXAIyDeRTbmAuJkGJN/9sfRKmyqoTgkF0HcLba2BYWA4jrtFz
	DAjr8VzANjCdoqkdzXm13jlbwtRpvyJeqmpVgllICIYt6Q05dwPMPcPOSrIFeCcdqYRa0NN
	bZLJOlHThweiF7EVWN03E/zy33Uv7nR2Rcdz1ROx7d3uZRf3UR4EKb1cY0RpdCIGy/1eDs/
	clW3qDLz0LncQjblgcj0xTfFW0S0jM2r+6DFMYx/kmLP+F+befFaRIY5SXdxgURv5Q+WDUv
	amBDM+Y1JbxXpHQ5c0qZU8QS7B2mZAco5f4BkARx1VzG+tJooQ3S48OY1D3w7lGIdV/+0Qy
	2lQKK/0Ho9T1d/B0O14e9Fy1WnRtw5a1dPoK9lITSAOEnZPmjhuAi9PGE9Zy8oYnlc9uYQs
	0hsgdZf1HZDMXBnHMPzeDQ=
X-QQ-RECHKSPAM: 0

SGVsbG8sDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcsDQpJIHRlc3QgdGhlIHBhdGNoIGlu
IG91ciB2Ni42IGtlcm5lbCwNCmluIDNhNjAwMCBwbGF0Zm9ybSBVbml4QmVuY2ggcmVzdWx0
cw0Kc3lzY2FsbCAxIHRocmVhZCBmcm9tIDk2NiB0byA5OTYNCjggdGhyZWFkcyBmcm9tIDYx
NzMgdG8gNjUwMS4NCg0KQmVzdCBSZWdhcmRzDQpXZW50YW8gR3Vhbg==

