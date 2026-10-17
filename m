Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC9F3AAF5D
	for <loongarch@lists.linux.dev>; Sat, 17 Oct 2026 07:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792222300; cv=none; b=HU3nbc5Nq5t2z+RDkrDwfM2tHNNjve1Ka1ZRPDnU+jvg3O843MpnDRGils7oEvCrvo/iTOtSeOZNWUF0grWOgqbrLz5Y1BeEhTnp1k+Zfxc0yXjRHJCE5r299nek5HxEX4lTb9XZ6pJ3aIKPisPd4UGlreFYy/ZukFWSb+5f7Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792222300; c=relaxed/simple;
	bh=hPwliJIrtfjOA0mdPlq4O4XFMuhybHzRdZVmphEq/Y0=;
	h=Date:From:To:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=I6r7B1jHHBEVHqmGgIMY+IZjzzPlNqb33gAHkb5Suzrx3+iJPZ+dTQHRsv+oBGbtA1xKqx3APJRtSqIWEWDc48xXafjQkbd9BdZEcgGw3ncuGHAoSSWNDaN650/y9lAQJmr0qQ4JG6Cgw+YnA8wmfsYQQNkd7hX2+BfV8caRNFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lpIx9Ua7; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lpIx9Ua7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=hPwliJIrtfjOA0mdPlq4O4XFMuhybHzRdZVmphEq/Y0=; b=l
	pIx9Ua7Osh9xLfei+Z4Y1YcrGnuLedxazUd+5A3WDgJhoi3xLbe8kdjs+XRyH8j3
	4WTOyaX1Av4aKIkMImY65pORi7rLZ9CP88Y7hdSD6zLSREyR7V+KlRqY/drOwMyn
	MUyvRyI3t3NFUrPcgBIsqzGO6P45xZJ7VEFeqcZcqA=
Date: Sat, 17 Oct 2026 15:31:29 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
	"Thomas Gleixner" <tglx@kernel.org>, "Radu Rendec" <radu@rendec.net>,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re:[PATCH 5/6] irqchip/loongarch-cpu: validate MADT LIO-PIC entries
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261016141357.2793046-6-yaojiale02@163.com>
References: <20261016141357.2793046-1-yaojiale02@163.com>
 <20261016141357.2793046-6-yaojiale02@163.com>
X-NTES-SC: AL_Qu2SAP6ZvUoj7yaaY+kdnEkQgO0/WsS1vfQu2Y5Wc+wEgCbN4z0YdHxaDHHN8e6DOSarnDiOagNHzNRcb4JHcFKRshiwMyp61tRZ0w/xog==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <2fb91df0.1858.1a148c5dee4.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZygvCgAnZyhSJNNqc_taAA--.123W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRGs5mrTJFEQVwAA3d
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMC0xNiAyMjoxMzo1NiwgIkppYWxlIFlhbyIgPHlhb2ppYWxlMDJAMTYzLmNvbT4g
d3JvdGU6Cj5UaGUgTElPLVBJQyBNQURUIGNhbGxiYWNrIHBhc3NlcyBhIHR5cGVkIHJlY29yZCB0
byB0aGUgY29udHJvbGxlcgo+aW5pdGlhbGl6YXRpb24gY29kZSB3aXRob3V0IGNoZWNraW5nIHRo
YXQgdGhlIGNvbXBsZXRlIHJlY29yZCBpcwo+cHJlc2VudC4gQSB0cnVuY2F0ZWQgZmlybXdhcmUg
ZW50cnkgY2FuIHRoZXJlZm9yZSBsZWFkIHRvIG91dC1vZi1ib3VuZHMKPmZpZWxkIHJlYWRzLgo+
Cj5SZWplY3QgaW5jb21wbGV0ZSBMSU8tUElDIGVudHJpZXMgYmVmb3JlIHBhc3NpbmcgdGhlbSB0
byB0aGUKPmluaXRpYWxpemF0aW9uIGhlbHBlci4KPgoKRml4ZXM6IGIyZDNlMzM1NGUyYSAoImly
cWNoaXA6IEFkZCBMb29uZ0FyY2ggQ1BVIGludGVycnVwdCBjb250cm9sbGVyIHN1cHBvcnQiKQoK
PlNpZ25lZC1vZmYtYnk6IEppYWxlIFlhbyA8eWFvamlhbGUwMkAxNjMuY29tPgo+LS0tCj4gZHJp
dmVycy9pcnFjaGlwL2lycS1sb29uZ2FyY2gtY3B1LmMgfCAzICsrKwo+IDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKykKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtbG9v
bmdhcmNoLWNwdS5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1sb29uZ2FyY2gtY3B1LmMKPmluZGV4
IDg0Y2UyNDg4OTQ4OC4uNjE4NTgyNTQ3N2Y0IDEwMDY0NAo+LS0tIGEvZHJpdmVycy9pcnFjaGlw
L2lycS1sb29uZ2FyY2gtY3B1LmMKPisrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtbG9vbmdhcmNo
LWNwdS5jCj5AQCAtMTE5LDYgKzExOSw5IEBAIHN0YXRpYyBpbnQgX19pbml0IGxpb2ludGNfcGFy
c2VfbWFkdCh1bmlvbiBhY3BpX3N1YnRhYmxlX2hlYWRlcnMgKmhlYWRlciwKPiB7Cj4gCXN0cnVj
dCBhY3BpX21hZHRfbGlvX3BpYyAqbGlvaW50Y19lbnRyeSA9IChzdHJ1Y3QgYWNwaV9tYWR0X2xp
b19waWMgKiloZWFkZXI7Cj4gCj4rCWlmIChCQURfTUFEVF9FTlRSWShsaW9pbnRjX2VudHJ5LCBl
bmQpKQo+KwkJcmV0dXJuIC1FSU5WQUw7Cj4rCj4gCXJldHVybiBsaW9pbnRjX2FjcGlfaW5pdChp
cnFfZG9tYWluLCBsaW9pbnRjX2VudHJ5KTsKPiB9Cj4gCj4tLSAKPjIuMzQuMQo=
