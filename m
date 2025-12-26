Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EB24C6D
	for <loongarch@lists.linux.dev>; Fri, 26 Dec 2025 18:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766773748; cv=none; b=Vfo4g/fwRzlPMfQJDhztVFHpGerMSn4Cle/BuD5cttC33OqKGF/bUxfvIKUD64wV8hV73FiVPaQl3h8iqTOIvY9CrIyLt6PMqBOPdxjYThgv6xloMPwSItNWhAKXNT6+AHXZnBvW4+X+MUELrZ2EEjLI/F5EHsz3QH08pKfRi9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766773748; c=relaxed/simple;
	bh=YNjjl4JloQtWYJc8KH6ljjC+Uzv22wnqishxcDOUnqg=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eDM1EGNo61N/3ldXllKxs577oIzyxLYRZgx+TssBVbwilcHZPL8uIHrVS+t0mt3L/HTO+rKVJ6Gn7vlKZBywn36bhLfcF5S6thJGVIWJYJCoUiBH+fsn4n5/dn5N7C0CeCjd/w/wzSxSI2oLL1jxfnPDngK5CiJrCnHJ/QdiFSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=EfO+ETFj; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="EfO+ETFj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1766773143;
	bh=YNjjl4JloQtWYJc8KH6ljjC+Uzv22wnqishxcDOUnqg=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=EfO+ETFjhBPINCHLM7ZWoVPti3baCUFx6ifapJhmLJZN5jryRMLPdEoodkWnq1LW5
	 7xZKG6GvUfV/ePFASiayLNn1+ecLaMM6HFqFRj8wnN/Q0I1+zMY19WcsNwF+yBRjZc
	 adqNEeQzbsryb1lmyWb9xTAPPqiGy0/KzKecZ+os=
Received: from [127.0.0.1] (2607-8700-5500-e873-0000-0000-0000-1001.16clouds.com [IPv6:2607:8700:5500:e873::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 6F4E066985;
	Fri, 26 Dec 2025 13:19:00 -0500 (EST)
Message-ID: <6e07d2defb5490ceaa017296c9c24cbba78d7c15.camel@xry111.site>
Subject: Re: Loongarch BPF JIT support Load-Acquire and Store-Release
 Instructions ?
From: Xi Ruoyao <xry111@xry111.site>
To: Vincent Li <vincent.mc.li@gmail.com>, Hengqi Chen
 <hengqi.chen@gmail.com>,  Tiezhu Yang <yangtiezhu@loongson.cn>, Chenghao
 Duan <duanchenghao@kylinos.cn>, Huacai Chen	 <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev
Date: Sat, 27 Dec 2025 02:18:58 +0800
In-Reply-To: <CAK3+h2xMF2AtKKHAh_Xt0NEk+dsVg5KRZ3wspLUtktmeU2Z_5A@mail.gmail.com>
References: 
	<CAK3+h2xMF2AtKKHAh_Xt0NEk+dsVg5KRZ3wspLUtktmeU2Z_5A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2025-12-25 at 10:04 -0800, Vincent Li wrote:
> While browsing through the 2025 Linux plumber conference videos and
> slides. slide Introduction to eBPF Load-Acquire and Store-Release [0]
> and video [1] caught my attention. Maybe Loongarch could consider
> supporting it?
>=20
> [0]:
> https://lpc.events/event/19/contributions/2163/attachments/1806/3886/Intr=
oduction%20to%20eBPF%20Load-Acquire%20and%20Store-Release%20Instructions.pd=
f

Load-acquire should just require a dbar 0b10100 before the load, and
store-release should just require a dbar 0b10010 after the store.

Unless BPF has some special definition of acquire/release that I don't
know.

--=20
Xi Ruoyao <xry111@xry111.site>
