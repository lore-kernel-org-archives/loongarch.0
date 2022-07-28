Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1B21101
	for <loongarch@lists.linux.dev>; Thu, 28 Jul 2022 09:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1658998982;
	bh=KQLaUEDK/p9raCwKFYx9LJ2k60Kkx8nJCoIDjwmyquQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=fQ1LAVN+re3U570saqSf87LFaF7V6g1dWQUrh5X33NR/gKEPQMyAhz086u3kTagyC
	 C9WkNl+M5W7OP8wUKG9VtdF/9/MdnkoqwfCkusF8VeFqDwgmnzqSQy1LQbBNVy3Zfe
	 qJqLEKeWA0C8Ohnq73jh/7XZWCShrhvOxLHTFG6E=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id C7463667C2;
	Thu, 28 Jul 2022 05:03:00 -0400 (EDT)
Message-ID: <00914cf65b64e06f370213fdc079111aa2a27145.camel@xry111.site>
Subject: Re: [PATCH 1/5] LoongArch: Add section of GOT for kernel module
From: Xi Ruoyao <xry111@xry111.site>
To: Youling Tang <tangyouling@loongson.cn>, loongarch@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Huacai
 Chen <chenhuacai@kernel.org>
Date: Thu, 28 Jul 2022 17:02:58 +0800
In-Reply-To: <849f514e-f78a-72a2-b94e-6974074b75eb@loongson.cn>
References: <385f63bcbee8e37c42f479ce9cdc7e7d731d419b.camel@xry111.site>
	 <3f43d51d530344f73a0a7087407799ff9dff3ba8.camel@xry111.site>
	 <849f514e-f78a-72a2-b94e-6974074b75eb@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2022-07-28 at 16:29 +0800, Youling Tang wrote:
> On 07/28/2022 12:26 AM, Xi Ruoyao wrote:
> > +	mod->arch.got.shdr->sh_type =3D SHT_NOBITS;
> > +	mod->arch.got.shdr->sh_flags =3D SHF_ALLOC;
> > +	mod->arch.got.shdr->sh_addralign =3D L1_CACHE_BYTES;
> > +	mod->arch.got.shdr->sh_size =3D (num_plts + 1) *
> > sizeof(struct plt_entry);
> > +	mod->arch.got.num_entries =3D 0;
> > +	mod->arch.got.max_entries =3D num_plts;
> =C2=A0Hi, Ruoyao
>=20
> =C2=A0=C2=A0We should use num_gots instead of num_plts when creating .got
> section.

Yes, it's a stupid error and I'll fix it in V2.

But why didn't this cause a malfunction on my system? :(.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
