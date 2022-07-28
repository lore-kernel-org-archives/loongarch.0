Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4141C35
	for <loongarch@lists.linux.dev>; Thu, 28 Jul 2022 14:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1659017139;
	bh=4mq3ALzqcoXjKHKDEAV4qG3tfzKP1hOZ+41Ord4qn4c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Wo8DcpkvA9bSo7m1eCkx3dGZUVMS8i8D6dAVevbhJbGkMkibIf+JUAVtz3Eaf4ALh
	 eVHkWe8465KvSyf8gPhf/kib4bDgAqD2TV7J/RrHvPfYLLOP1VgFbjXAhGYQE3vpzR
	 xo9WTpwkrAq4LK8CeNTSGgICcaYMn0bQf2X48tCI=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id D8CA866818;
	Thu, 28 Jul 2022 10:05:36 -0400 (EDT)
Message-ID: <b4e9c57b4e863cc105fbf9a8e6bbfc1407ee35ca.camel@xry111.site>
Subject: Re: [PATCH v2 0/4] LoongArch: Support new relocation types
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: loongarch@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, Youling Tang <tangyouling@loongson.cn>, Jinyang
 He <hejinyang@loongson.cn>
Date: Thu, 28 Jul 2022 22:05:34 +0800
In-Reply-To: <CAAhV-H5C3LW-xFV-4KsJZHow3av0qeV-sHUSJTUp=hwHGfO1wg@mail.gmail.com>
References: <c596e7a73953a1c49e8f5e94ec2db642f72e7813.camel@xry111.site>
	 <CAAhV-H5C3LW-xFV-4KsJZHow3av0qeV-sHUSJTUp=hwHGfO1wg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2022-07-28 at 20:33 +0800, Huacai Chen wrote:
> Hi, Arnd,

/* snip */

> Could you update the cross-compilers here [1] to make this series be
> possible upstream in the 5.20 cycle? Or we can only do that until new
> binutils/gcc be released?

Hi Huacai and Arnd,

The old toolchain will use

    R_LARCH_PUSH_PCREL _GLOBAL_OFFSET_TABLE_
    R_LARCH_PUSH_GPREL symbol
    R_LARCH_ADD

to perform a PC-relative addressing for a GOT entry, and the new
toolchain will use R_LARCH_GOT_PC_{HI20,LO12}.  Both way are supported
by this series.

I've tested the V3 patch (V2 + suggestions from Youling, I'll sent it
later after rewording the third patch) with both my system toolchain (no
new reloc support) and a toolchain built from binutils & gcc master.=20
Both of the build works fine.

So a toolchain update seems not immediately required.
--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
