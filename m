Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42EE6138
	for <loongarch@lists.linux.dev>; Thu, 17 Nov 2022 15:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1668699742;
	bh=aJ3Su7Id8fFh36dDnfD7Im9eQ/HKaolYvEEtMS4T6wA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gcnqWlsJVFIti3S36UCLPp6LZWk61Yum6VxXfUEEo4xF3bzMGzkJwph+NBHUoWZFQ
	 +1XyIzoo2E9NcQI+br42vmJf0KXrTfNAGUhS2wgJl36idviXeRB4RUxnxHUh5GWZI1
	 E5Jxa6DoZmf1A2F3e6ZkZKKVJLO93ciY9CMFCDSc=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 61F7565DD0;
	Thu, 17 Nov 2022 10:42:19 -0500 (EST)
Message-ID: <b402098421927699db853e5e05fbb9d48fa24886.camel@xry111.site>
Subject: Re: [PATCH 04/47] LoongArch: Set _PAGE_DIRTY only if _PAGE_WRITE is
 set in {pmd,pte}_mkdirty()
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren
 <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, "David S . Miller" <davem@davemloft.net>, 
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,  Peter Xu <peterx@redhat.com>
Date: Thu, 17 Nov 2022 23:42:17 +0800
In-Reply-To: <b1707e1c04a6a9b91fd5f70ea012b5bcc764516e.camel@xry111.site>
References: <20221117042532.4064448-1-chenhuacai@loongson.cn>
	 <b1707e1c04a6a9b91fd5f70ea012b5bcc764516e.camel@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2022-11-17 at 21:59 +0800, Xi Ruoyao wrote:
> Hi Huacai,
>=20
> On Thu, 2022-11-17 at 12:25 +0800, Huacai Chen wrote:
> > Now {pmd,pte}_mkdirty() set _PAGE_DIRTY bit unconditionally, this cause=
s
> > random segmentation fault after commit 0ccf7f168e17bb7e ("mm/thp: carry
> > over dirty bit when thp splits on pmd").
>=20
> Hmm, the pte_mkdirty call is already removed in commit 624a2c94f5b7a081
> ("Partly revert \"mm/thp: carry over dirty bit when thp splits on
> pmd\"").
>=20
> Not sure if this issue is related to some random segfaults I've observed
> recently though.=C2=A0 My last kernel build contains 0ccf7f168e17bb7e but
> does not contain 624a2c94f5b7a081.

I can confirm this patch alone (without 624a2c94f5b7a081) fixes the
random segfaults I've recently encountered running GCC testsuite.

Link: https://gcc.gnu.org/pipermail/gcc/2022-November/239857.html
Tested-by: Xi Ruoyao <xry111@xry111.site>

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
