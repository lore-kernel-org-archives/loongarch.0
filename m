Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91906443A
	for <loongarch@lists.linux.dev>; Sun, 28 Aug 2022 16:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1661703463;
	bh=pAB12YlbwUUdUtoU8ZK6L+lwjyTWFJNA7PB9OW17gCQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=d221tSrkumUHAL6lpxcBeqotrtTPZhYE7abQMGQFbqKPonvgRMTNJAhVJNOuScZrZ
	 0K/q4izW8hvYG/ORhhjTahKk4oKsfrJyaz1xkH3ewdGyKewa10T5Ybrj4EWR9ZGWrl
	 9xid0cKCGLpbqh5Pf//gnZhTImqeZ6htkLXv6nEQ=
Received: from [IPv6:240e:358:111c:cf00:dc73:854d:832e:4] (unknown [IPv6:240e:358:111c:cf00:dc73:854d:832e:4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 4C48B65AA3;
	Sun, 28 Aug 2022 12:17:39 -0400 (EDT)
Message-ID: <b681993ca92d5243a73e23303ff9386ad03cf05a.camel@xry111.site>
Subject: Re: [PATCH 0/8] LoongArch: Support toolchain with new relocation
 types
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, Youling Tang <tangyouling@loongson.cn>, Jinyang
 He <hejinyang@loongson.cn>
Date: Mon, 29 Aug 2022 00:17:32 +0800
In-Reply-To: <CAAhV-H4+=CqeRUUt+XPZ2Nf=1GRgHtTFyMuVu-y6QdgQgD4mog@mail.gmail.com>
References: <20220827175436.156464-1-xry111@xry111.site>
	 <CAAhV-H4+=CqeRUUt+XPZ2Nf=1GRgHtTFyMuVu-y6QdgQgD4mog@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.45.2 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2022-08-28 at 22:15 +0800, Huacai Chen wrote:
> 1, You can still call it v5, even if it has changed a lot;

Ok, so should I call the next version v2 or v6?

Sorry for introducing such a mess :(.

> 2, In my opinion, patch 4,5,7,8 can be combined, but I don't insist if
> you have a good reason to separate.

If we'll drop support for old GCC/Binutils, we can drop patch 5 (it's
only needed for the combination of old GCC and new Binutils).  Then
squash 4 and 7.  8 should still be standalone IMO.

> 3, If possible, I still prefer to remove old relocation types support,
> in order to make life easier, especially for objtool that is queued
> for upstream.

How about this?  I'm not sure if it's proper to invoke "error" in
Makefile.

ifneq ($(shell $(CC) $(srctree)/arch/loongarch/scripts/toolchain-check.c &>=
 /dev/null -o /dev/null && echo "ok"), ok)
  ifdef CONFIG_MODULES
    $(error "toolchain is too old for LoongArch modular kernel")
  endif
endif

toolchain-check.c:

#if !__has_attribute(model)
#error no model attribute
#endif

int main()
{
	__asm__("x:pcalau12i $t0,%pc_hi20(x)");
}
--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
