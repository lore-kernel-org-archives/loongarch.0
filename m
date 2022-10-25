Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779C9800
	for <loongarch@lists.linux.dev>; Tue, 25 Oct 2022 02:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1666666155;
	bh=6lg+KoWRlD/cwXL0x9NRziryKL3JMQgD1v/R4PKp/xw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ffa/zn+JaPKgSauTXzSu6DGULLydjLNLwDqQFwSpT16RNs7THAmdXjkHfwryh1DOt
	 fOiQdXJBIsfO1doK6eRVHrHm9XvybYuZB7W5XxHdds5hW1/vQIGQ8ivIBHqwT7DB4H
	 zzoxml2oGE0k99956NjM22VhBB5umSime+78kZ1E=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 24F5965B29;
	Mon, 24 Oct 2022 22:49:13 -0400 (EDT)
Message-ID: <04678abc64a9675164bf1c83468d2a8dd0a685a4.camel@xry111.site>
Subject: Re: [PATCH 01/13] LoongArch: Unify CSR.EUEN and CSR.ECFG bitfield
 names with the ISA manual
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
Date: Tue, 25 Oct 2022 10:49:12 +0800
In-Reply-To: <CAAhV-H7io32r6Lh9sBuqeoZ5qdTasQBvUnCKESvzSiiUMoT1OA@mail.gmail.com>
References: <20221024121305.381776-1-kernel@xen0n.name>
	 <20221024121305.381776-2-kernel@xen0n.name>
	 <CAAhV-H7io32r6Lh9sBuqeoZ5qdTasQBvUnCKESvzSiiUMoT1OA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2022-10-24 at 22:53 +0800, Huacai Chen wrote:
> > diff --git a/arch/loongarch/include/asm/fpu.h b/arch/loongarch/include/=
asm/fpu.h
> > index 358b254d9c1d..a5015b6536bc 100644
> > --- a/arch/loongarch/include/asm/fpu.h
> > +++ b/arch/loongarch/include/asm/fpu.h
> > @@ -37,13 +37,13 @@ static inline unsigned long mask_fcsr_x(unsigned lo=
ng fcsr)
> >=20
> > =C2=A0 static inline int is_fp_enabled(void)
> > =C2=A0 {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return (csr_read32(LOONGARCH_CSR_=
EUEN) & CSR_EUEN_FPEN) ?
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return (csr_read32(LOONGARCH_CSR_=
EUEN) & CSR_EUEN_FPE) ?
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 : 0;
> > =C2=A0 }
> >=20
> > -#define enable_fpu()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 set_csr_euen(CSR_EUEN_FPEN)
> > +#define enable_fpu()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 set_csr_euen(CSR_EUEN_FPE)
> I don't think code should be exactly the same as manual, especially
> FPE may be misunderstood as "FP Exception".

If I were naming this field I'd say "CSR_EUEN_FP".  After all "EN" in
"EUEN" already means "enable".

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
