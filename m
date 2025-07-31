Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B852206B2
	for <loongarch@lists.linux.dev>; Thu, 31 Jul 2025 09:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.154.197.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753954282; cv=none; b=D3oRcBcsdE9X1yPz5tuYfLsiq0+BXHX+gDlhjkRZj01Gj7ty0xEJNCA8EDsto1eR6pHjY0xQ5iJpzMZnsc0H7lKCU/wpCH8wicNwM7/gxdODDF1bKhjq+5ompVWdupLg3Jx+25Ybeu8DaI8r0yJIBlTtPHBMtkN4Da8OO3PCxdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753954282; c=relaxed/simple;
	bh=+4UFIb11PcuMQKSx8oTsCEXmWQmy0KqA/BRL69pqq6U=;
	h=From:To:Cc:Subject:Mime-Version:Content-Type:Date:Message-ID:
	 References:In-Reply-To; b=Z70E08sIUJI9wrXvNOmK0I6PpuP4t2vk0BGNawapPhWGdJq/sWInaK/XNGiOuOUVbPAu23CT2mKImEep3GGrtGJH1/e1uOEy3rMx0KwnM1uClplFefpzggPFNelUsetbJUbA1DiiQjsD1RBp0PPMq+uR5zv4/B9NGVQUnwyqwBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=NaaP26FL; arc=none smtp.client-ip=43.154.197.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="NaaP26FL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1753954229;
	bh=+4UFIb11PcuMQKSx8oTsCEXmWQmy0KqA/BRL69pqq6U=;
	h=From:To:Subject:Mime-Version:Date:Message-ID;
	b=NaaP26FLobMu+sh6wIqi7qxgLIuPnzB4CRrzFhFCX4Tf2MVJLX7xo1p2diG3vXLXb
	 zB1ka4NfZa/KimgxtR0lIWDrmQjDa6TebZXqAQGpQsaEIUhAHwvmLf9RX3lGCWUyN2
	 PkT+2oWR1vK021EQpNUbnC88HJmVQtxhRooS9f40=
EX-QQ-RecipientCnt: 6
X-QQ-GoodBg: 2
X-QQ-SSF: 00400000000000F0
X-QQ-FEAT: D4aqtcRDiqST8P4pfj07qGG6ZowgZlQrBrKFg+dHp6U=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: 9w57OOO5FF5cXB6+6BHQCQz7t5/qQaujCSyd1aXWj3o=
X-QQ-STYLE: 
X-QQ-mid: lv3sz3a-6t1753954225tc6a4d04b
From: "=?utf-8?B?V2VudGFvIEd1YW4=?=" <guanwentao@uniontech.com>
To: "=?utf-8?B?WWFudGVuZyBTaQ==?=" <siyanteng@cqsoftware.com.cn>, "=?utf-8?B?Y2hlbmh1YWNhaQ==?=" <chenhuacai@kernel.org>
Cc: "=?utf-8?B?V0FORyBYdWVydWk=?=" <kernel@xen0n.name>, "=?utf-8?B?amlheHVuLnlhbmc=?=" <jiaxun.yang@flygoat.com>, "=?utf-8?B?eWlqdW4=?=" <yijun@loongson.cn>, "=?utf-8?B?bG9vbmdhcmNo?=" <loongarch@lists.linux.dev>, "=?utf-8?B?WWFudGVuZyBTaQ==?=" <siyanteng@cqsoftware.com.cn>
Subject: Re:[PATCH] LoongArch: CSR: Complete KSave registers definition
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Thu, 31 Jul 2025 09:30:24 +0000
X-Priority: 3
Message-ID: <tencent_561EDC7155FE49AB4553AF12@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20250725103624.69247-1-siyanteng@cqsoftware.com.cn>
In-Reply-To: <20250725103624.69247-1-siyanteng@cqsoftware.com.cn>
X-QQ-ReplyHash: 3597567530
X-BIZMAIL-ID: 6575991458928444153
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Thu, 31 Jul 2025 17:30:26 +0800 (CST)
Feedback-ID: lv:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NRN3UPsLzYKVL1qhsBQSr50EyNQYDiw2qz7GEauZTHXq+XoZdantdjA4
	xSrkBUhJcIAZqJJQ2JNkJdfO5HevBnKssLn84xjrrZqEi6rYY2Z9go07q0EREvUWCPSDsrz
	Rbr8idehjud7zCV7NWyddttW+gqHbWCysKFSsTbT7oQukopqAzqL8JsgjrL1aDbiTPz7tdT
	7cGbHFAHenAkD3O3M8q9V+P9qgEBTyGJixndlV+n3OSVALTxNuHYvKDK0xwIWiXnEsmrzPE
	Fb81/lOYE+oFBTmPW1JsyUxG/Tui4m/yntwLvpuOOQ8CySTOTXUmHuDervFe9SfFI0lP1Gs
	RPe1sHtTIgD+WVFEVCiIKokAEOA0bz+bxCuzObGuz7xR/hSxOAiN4rPhndrTHcNob6fgOlG
	hdNYTvm7OEWgJuCOPGqC8OW+8KiyCWeYdYD80klB6M0ywsJTAi8LRQvhW8bG9EMM77OkrpR
	r34JlHqvQ4n4gS72lC+r9+f+qCBfMns/uqhkxudC8ri84i6Xl5JwVl4M8tueEqbBjDmsxlF
	lxOpGL3uxiP3hjhsYyeuFplCcLsbKUhdCNMmWvq+9EuEg6FpjrgSBKP+33mtjuEKsAeTyUz
	tSYdrdGgi9CGkqiEs6l/5EmGOL/jzw9U7hupFF8X9/67eiji3rBZGyszLq/MSiiolPe1fXX
	KTuyHBZ6gz0VUdOYT+r5+c4lC8rLTc9yNTXJ5s+2iMDJ2tGmNZREd6fbePIe9Ulxgm2ovVb
	w3hUXWMiEOk30+9ut/8k0Y98dPyob3uhSZ3SRmkkTTKn36zmkSs4jwGLREngG395AWseJz4
	Ym1Eh16aoInKEq3YqJmI63hQaXKeI4b08gvoVr4+rqsRvVFj9+0Yw/9RJV8jZB35Ojojy1f
	CwmJgZNWXEfdfOR+EOWx09QvLIm+GNDQau9UkDVNnv6PSa7eqji8IFRLCtAtDMapLpwRdCW
	sCn3aJnIfVOXu0EIODSd4t7JswcmnOoUToJvnbftMVGMcmhoDfZbiDOuwWaGwfuE2Or+c8R
	qSB/C9u1Jf35u06b94FA+iaOmg/KSlsTPv4Pn7lw==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

SGVsbG8gWWFudGVuZzoNCg0KQXMgdGhlIG1hbnVhbCBzYXkgYmVsb3csIA0KIlRoZSBtaW5p
bXVtIG51bWJlciBvZiBkYXRhIHNhdmUgcmVnaXN0ZXJzIGlzIDEsIGFuZCB0aGUgbWF4aW11
bSBudW1iZXIgaXMgMTYuIg0KSSBzZWFyY2ggdGhlIHByZWZpeCBwYXR0ZXJuICJMT09OR0FS
Q0hfQ1NSX0tTIiBpbiB2Ni4xNiBrZXJuZWwgc291cmNlLA0KdGhlIEtTMC1LUzcgaGFzIGJl
ZW4gdXNlZCwgaWYgaGFyZHdhcmUgc3VwcG9ydCBpdCwgYWRkIGl0IGxvb2sgb2suDQo8Qnkg
dGhlIHdheSwgdGhlIEtTOCBkZWZpbmVkIGlzIHN0cmFuZ2UsIGl0IGRlZmluZWQgYnV0IG5v
dCB1c2VkLCBpIGRvbmB0IGtub3cgd2h5Lj4NCg0KTm90ZSB0aGF0IGFzIG1hbnVhbCB2MS4x
MCB2NC4yLjEgc2F5Og0KIldoZW4gYSBDU1IgYWNjZXNzIGluc3RydWN0aW9uIGFjY2Vzc2Vz
IGEgQ1NSIHRoYXQgDQppcyBub3QgZGVmaW5lZCBpbiB0aGUgYXJjaGl0ZWN0dXJlIG9yIG5v
dCBpbXBsZW1lbnRlZCBpbiBoYXJkd2FyZSwgDQp0aGUgcmVhZCBvcGVyYXRpb24gcmV0dXJu
cyBhbiBhbGwgMCB2YWx1ZXMgYW5kIA0KdGhlIHdyaXRlIG9wZXJhdGlvbiBkb2VzIG5vdCBt
b2RpZnkgYW55IHNvZnR3YXJlLXZpc2libGUgc3RhdGUgb2YgdGhlIHByb2Nlc3Nvci4iDQpS
ZXZpZXdlZC1ieTogV2VudGFvIEd1YW4gPGd1YW53ZW50YW9AdW5pb250ZWNoLmNvbT4NCg0K
QlJzDQpXZW50YW8gR3Vhbg==

