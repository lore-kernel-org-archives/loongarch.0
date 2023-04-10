Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95953320A
	for <loongarch@lists.linux.dev>; Mon, 10 Apr 2023 12:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1681129210;
	bh=LDfsmCHHm9SPOS24B6i9AltvoxInTtvi6NItDUQ4vb4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ffxvJr4w1AWyLxtCYueJU4bjsY9MKonfWa66xxqO6hXQi013eQhLYbqgekXjaNjDp
	 2ayP0U3uNwMP5Pzb24EopgZjmW3qlVlC47VbN+Xemjx3X+gKFVMhof5AiCG9Iw9Whm
	 S1Xi6/hWHjffIurj/d11vPwoMT4p2T1q2aokJ53c=
Received: from [192.168.124.11] (unknown [113.140.11.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id E118A66295;
	Mon, 10 Apr 2023 08:20:08 -0400 (EDT)
Message-ID: <c90c442fe029bfb9c4487284366800b8781954e1.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: Improve memory ops
From: Xi Ruoyao <xry111@xry111.site>
To: WANG rui <wangrui@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	loongson-kernel@lists.loongnix.cn
Date: Mon, 10 Apr 2023 20:20:01 +0800
In-Reply-To: <20230410115734.93365-1-wangrui@loongson.cn>
References: <20230410115734.93365-1-wangrui@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

T24gTW9uLCAyMDIzLTA0LTEwIGF0IDE5OjU3ICswODAwLCBXQU5HIHJ1aSB3cm90ZToKPiArwqDC
oMKgwqDCoMKgwqAvKiBhbGlnbiB1cCBhZGRyZXNzICovCj4gK8KgwqDCoMKgwqDCoMKgYW5kacKg
wqDCoMKgdDEsIGEwLCA3Cj4gK8KgwqDCoMKgwqDCoMKgc3ViLmTCoMKgwqBhMCwgYTAsIHQxCgpi
c3RyaW5zLmQgYTAsIHplcm8sIDIsIDAKCkxpa2V3aXNlIGZvciBvdGhlciBhbGlnbmluZyBvcGVy
YXRpb25zIGlmIHRoZSB0ZW1wb3JhcnkgaXMgbm90IHVzZWQuCgo+ICvCoMKgwqDCoMKgwqDCoGFk
ZGkuZMKgwqBhMCwgYTAsIDgKCi0tIApYaSBSdW95YW8gPHhyeTExMUB4cnkxMTEuc2l0ZT4KU2No
b29sIG9mIEFlcm9zcGFjZSBTY2llbmNlIGFuZCBUZWNobm9sb2d5LCBYaWRpYW4gVW5pdmVyc2l0
eQo=

