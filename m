Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00381514F4
	for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 19:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711567994; cv=none; b=kOu5S1whasechx8vXeT7mV+YZRd5UBjRIdBXXEdHqi/4a7cQugDgt2D27ENk2HwqYmkUs+VI4LwVRkGiAR0lHAxJdMBlZqrwBFKNEKRXyY7yWtTf/CqjLS8KOW4UjWhPgLjhBSDlfDy7vdd6KQmJqaC5DT+KlguQfQI/XtglCdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711567994; c=relaxed/simple;
	bh=dmSKRn1YP1sM5l4LbQabquMp3yhVxs4wEJRW8a/mfk8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OIjGHkzq5pXbK//dNO5it3OcE+/IeEGv/ZfREa6duirDtJHFQn3DeEwx6pr6mmBJuiWGiCxJu+H+bYMb5VIlkSQZe4N2ObNbIQR0rQhpVxHSl4uo+4oA07bqMXBH7dYdJKboeyDqYAm0U/OADfAa0jrFE7lTaX0nWP/V0beIX2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=I7VDWqtE; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="I7VDWqtE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1711567987;
	bh=dmSKRn1YP1sM5l4LbQabquMp3yhVxs4wEJRW8a/mfk8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=I7VDWqtEqwRMMDN2SOX/X8GKmhYcJGsjpF1KpyWM+yMJ/d74QKs4CnN47gkR3wyly
	 E6y0sZtdekt69IS4VVfu8M6Z8RkwtW/7XQfagSXg8GTS3lQWvuM9iZzFsESQyVGvnR
	 wA+AG8FKaDybyiHz1fpvjCdXvWVKUNgqGBQy+dYU=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id E7547676A2;
	Wed, 27 Mar 2024 15:33:05 -0400 (EDT)
Message-ID: <4d2373e3f0694fd02137a72181d054ee2ebcca45.camel@xry111.site>
Subject: Re: Kernel BUG with loongarch and CONFIG_KFENCE and CONFIG_DEBUG_SG
From: Xi Ruoyao <xry111@xry111.site>
To: Guenter Roeck <linux@roeck-us.net>, loongarch@lists.linux.dev
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Alexander Potapenko
	 <glider@google.com>, Marco Elver <elver@google.com>, Dmitry Vyukov
	 <dvyukov@google.com>, kasan-dev@googlegroups.com
Date: Thu, 28 Mar 2024 03:33:03 +0800
In-Reply-To: <c352829b-ed75-4ffd-af6e-0ea754e1bf3d@roeck-us.net>
References: <c352829b-ed75-4ffd-af6e-0ea754e1bf3d@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2024-03-27 at 12:11 -0700, Guenter Roeck wrote:
> Hi,
>=20
> when enabling both CONFIG_KFENCE and CONFIG_DEBUG_SG, I get the following
> backtraces when running loongarch images in qemu.
>=20
> [=C2=A0=C2=A0=C2=A0 2.496257] kernel BUG at include/linux/scatterlist.h:1=
87!
> ...
> [=C2=A0=C2=A0=C2=A0 2.501925] Call Trace:
> [=C2=A0=C2=A0=C2=A0 2.501950] [<9000000004ad59c4>] sg_init_one+0xac/0xc0
> [=C2=A0=C2=A0=C2=A0 2.502204] [<9000000004a438f8>] do_test_kpp+0x278/0x6e=
4
> [=C2=A0=C2=A0=C2=A0 2.502353] [<9000000004a43dd4>] alg_test_kpp+0x70/0xf4
> [=C2=A0=C2=A0=C2=A0 2.502494] [<9000000004a41b48>] alg_test+0x128/0x690
> [=C2=A0=C2=A0=C2=A0 2.502631] [<9000000004a3d898>] cryptomgr_test+0x20/0x=
40
> [=C2=A0=C2=A0=C2=A0 2.502775] [<90000000041b4508>] kthread+0x138/0x158
> [=C2=A0=C2=A0=C2=A0 2.502912] [<9000000004161c48>] ret_from_kernel_thread=
+0xc/0xa4
>=20
> The backtrace is always similar but not exactly the same. It is always
> triggered from cryptomgr_test, but not always from the same test.
>=20
> Analysis shows that with CONFIG_KFENCE active, the address returned from
> kmalloc() and friends is not always below vm_map_base. It is allocated by
> kfence_alloc() which at least sometimes seems to get its memory from an
> address space above vm_map_base. This causes virt_addr_valid() to return
> false for the affected objects.

Oops, Xuerui has been haunted by some "random" kernel crashes only
occurring with CONFIG_KFENCE=3Dy for months but we weren't able to triage
the issue:

https://github.com/loongson-community/discussions/issues/34

Maybe the same issue or not.

> I have only seen this if CONFIG_DEBUG_SG is enabled because sg_set_buf()
> otherwise does not call virt_addr_valid(), but I found that many memory
> allocation calls return addresses above vm_map_base, making this a
> potential problem when running loongarch images with CONFIG_KFENCE enable=
d
> whenever some code calls virt_addr_valid().
>=20
> I don't know how to solve the problem, but I did notice that virt_to_page=
()
> does handle situations with addr >=3D vm_map_base. Maybe a similar soluti=
on
> would be possible for virt_addr_valid().
>=20
> Thanks,
> Guenter
>=20

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
