Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33C2A28
	for <loongarch@lists.linux.dev>; Tue, 29 Aug 2023 06:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1693291545;
	bh=5AkBjHkJ4WI+1x5Ygt8sxJSWjs6pPOabw9NZYf8A9v4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=KB/0HVmMhPzCzyfrCRhogior74gf0wAipL3ZWHvmfYauDvpn7IzO6ucKj3nv6W+KC
	 p6EUft8iVmSZjC0BRFde19VIRreOuy3iO0ee7l2JoCHBlXb+3YTyHbHmDTJErzzrbE
	 PHgL/d3w4GiCyd2L4LVHNXrUiSDFUKb+ZRWBpTyI=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id E22B56599B;
	Tue, 29 Aug 2023 02:45:43 -0400 (EDT)
Message-ID: <b826520103c7462b0c2f10a7bc69347799d1217b.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: Define the symbol fault as a local label in
 fpu.S
From: Xi Ruoyao <xry111@xry111.site>
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	loongson-kernel@lists.loongnix.cn
Date: Tue, 29 Aug 2023 14:45:42 +0800
In-Reply-To: <1693290485-3516-1-git-send-email-yangtiezhu@loongson.cn>
References: <1693290485-3516-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2023-08-29 at 14:28 +0800, Tiezhu Yang wrote:
> The initial aim is to silence the following objtool warnings:
>=20
> =C2=A0 arch/loongarch/kernel/fpu.o: warning: objtool: _save_fp_context() =
falls through to next function fault()
> =C2=A0 arch/loongarch/kernel/fpu.o: warning: objtool: _restore_fp_context=
() falls through to next function fault()
> =C2=A0 arch/loongarch/kernel/fpu.o: warning: objtool: _save_lsx_context()=
 falls through to next function fault()
> =C2=A0 arch/loongarch/kernel/fpu.o: warning: objtool: _restore_lsx_contex=
t() falls through to next function fault()
> =C2=A0 arch/loongarch/kernel/fpu.o: warning: objtool: _save_lasx_context(=
) falls through to next function fault()
> =C2=A0 arch/loongarch/kernel/fpu.o: warning: objtool: _restore_lasx_conte=
xt() falls through to next function fault()
>=20
> Obviously, the symbol fault is not a function, it is just a local label,

Hmm why?  To me this seems a function.  We don't branch to it but store
its address (a "function pointer") in the extable.

And these warnings do not make any sense to me:

/* snip */

> diff --git a/arch/loongarch/kernel/fpu.S b/arch/loongarch/kernel/fpu.S
> index b4032de..7defe50 100644
> --- a/arch/loongarch/kernel/fpu.S
> +++ b/arch/loongarch/kernel/fpu.S
> @@ -521,7 +521,7 @@ SYM_FUNC_START(_restore_lasx_context)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0jr=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0ra

_restore_lasx_context returns with this instruction.  How can it fall
through into fault?

> =C2=A0SYM_FUNC_END(_restore_lasx_context)

> -SYM_FUNC_START(fault)
> +SYM_CODE_START_LOCAL(fault)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0li.w=C2=A0=C2=A0=C2=A0=C2=
=A0a0, -EFAULT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# failure
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0jr=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0ra
> -SYM_FUNC_END(fault)
> +SYM_CODE_END(fault)

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
