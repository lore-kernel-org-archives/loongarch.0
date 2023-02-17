Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C59C7F
	for <loongarch@lists.linux.dev>; Fri, 17 Feb 2023 08:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1676621350;
	bh=vVf5VbiVyKplW7aWezPMq82Yq0t9rkQkhpF/eqcg270=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=IJ6AmcpDeD3m20zBJRDwrPZc1SwNU9tyDaj/GmC+kPOro3d7WvK04qbHNlh9wKxJU
	 wLiOyA1Gr828Yc+CLXixdK0rAbg22LlJpqFcEbreQj2BlcKQFhVaeZGTue2W8owzCU
	 on/y+YsAI6f7lDVRtnt/RvJTnA1JLuDeqQZEDRlA=
Received: from [IPv6:240e:358:1156:5900:dc73:854d:832e:4] (unknown [IPv6:240e:358:1156:5900:dc73:854d:832e:4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id C46F365CF0;
	Fri, 17 Feb 2023 03:09:07 -0500 (EST)
Message-ID: <41b6c7b779c1c4d33c644c406f337e27e124adaa.camel@xry111.site>
Subject: Re: [PATCH v4 5/5] LoongArch: Add support for kernel address space
 layout randomization (KASLR)
From: Xi Ruoyao <xry111@xry111.site>
To: Youling Tang <tangyouling@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>,  Jinyang He <hejinyang@loongson.cn>
Cc: Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Fri, 17 Feb 2023 16:09:04 +0800
In-Reply-To: <1676018856-26520-6-git-send-email-tangyouling@loongson.cn>
References: <1676018856-26520-1-git-send-email-tangyouling@loongson.cn>
	 <1676018856-26520-6-git-send-email-tangyouling@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

T24gRnJpLCAyMDIzLTAyLTEwIGF0IDE2OjQ3ICswODAwLCBZb3VsaW5nIFRhbmcgd3JvdGU6Cgo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBTeW5jIHRoZSBjYWNoZXMgcmVhZHkg
Zm9yIGV4ZWN1dGlvbiBvZiBuZXcga2VybmVsCj4gKi8KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgX19hc21fXyBfX3ZvbGF0aWxlX18gKAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgImliYXIgMCBcdFxuIgo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgImRiYXIgMCBcdFxuIik7CgpJIHRoaW5rIHdl
IHNob3VsZCBhZGQgOjo6ICJtZW1vcnkiIGhlcmUgdG8gcHJldmVudCBhIGZ1dHVyZSBjb21waWxl
cgpmcm9tIGJlaW5nIHRvbyBzbWFydC4KCk90aGVyd2lzZSBMR1RNLgoKLS0gClhpIFJ1b3lhbyA8
eHJ5MTExQHhyeTExMS5zaXRlPgpTY2hvb2wgb2YgQWVyb3NwYWNlIFNjaWVuY2UgYW5kIFRlY2hu
b2xvZ3ksIFhpZGlhbiBVbml2ZXJzaXR5Cg==

