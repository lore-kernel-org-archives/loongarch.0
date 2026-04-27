Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB82239BFF5
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 08:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777279418; cv=none; b=MQ0urrd6bKKpHSPqM0zHX3Y/al+FRx7cBw7kQL8sNbqSF130Ecpt/j+UbLD1DG6rsxyhPoHiAqUcYaBCD8ORvsMi/bdQhST/jtRw9tBGiS/j/TRYtFj/wpRrH4kylNkDdZJ2WXXukqmXQyi8nMCh6bD8sgbgP8OCY1rln72Eu5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777279418; c=relaxed/simple;
	bh=I1GESzWue9snNjYyMS+G9EoVs15ExD6hE1NIvULPZIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LKiGY/9kJc9seHPvIHsLLEGl/OwsB7JbZUWHhDl6L5JTVM0gYfJ6AU6Gc3ukkYSKD1K/vjP6nqEzL/PQUY4CEB77POfbzPEx9wvyGN2zeF4YFrIDB4QKvNowGMPbo9wZ+clv7rG+eGL+DIWdVH9Mttigt0999PBMd1kVBFQ36TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oPI+2Qfr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oPI+2Qfr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73271C2BCB6
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 08:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777279418;
	bh=I1GESzWue9snNjYyMS+G9EoVs15ExD6hE1NIvULPZIo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oPI+2QfrBCZ4jIH9spt9zoRi2faw8ql+XyNW27oNxcAImRne21RHT2QULCNtEKYSJ
	 mKtrwomdlLLaiL7njG86L0QM8SLnigCphiWwGr80p65e9uVlHCCvrwXHbg5ZetKcCS
	 rYKZampBvtNFIXa9XjqxpmsNX545xWPmxa/FhgJNaWLB2Rsmos13O91hLnL4v3oRVR
	 GV47pNANnXaQ7bIQJf46OOR+dT6X3WJSigp5MJOSEkG5NWMHXNb1EigpSjJ6Qh2Mro
	 h55jdPslLxgtJJtjul+pavsqdR3iXnurIZMZ9iNbhIkkhI8cXu4D13W5OWHK72WTzR
	 YpRkip3WUhbdg==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b8f9568e074so1643958566b.0
        for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 01:43:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+XCyBB1Ua3WmgrMvVqQOXR+Rx9SCsVdHBg9qY2Y5MKYyo4cA5BnjJRa2xcjKnKuF/JuDoy9lIYcAs=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa142cd6z66yEa2hB3qBxYGoDbbCc9PpnMGbBG4fV9lWWaKkE9
	zVUP6NZXUb6z2pOW6Wszbm9cbH8RqPMIznU9BS4JKWOS4S5q19sYFzIw4LteJh4nDizgQCWRRNZ
	orqdnhxNVfR8sMrkYw1EYjra8AvnnaZE=
X-Received: by 2002:a17:907:6d29:b0:bac:39f1:220e with SMTP id
 a640c23a62f3a-bac39f12249mr794824966b.37.1777279416919; Mon, 27 Apr 2026
 01:43:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260409121936.871418-1-xry111@xry111.site> <de142a5e34f9158500361e51d5a025bf3366699e.camel@xry111.site>
In-Reply-To: <de142a5e34f9158500361e51d5a025bf3366699e.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 27 Apr 2026 16:43:34 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4kxm-yfgxkxo+8NTvcRtz=uc8G0iTuKEbynkB6pMBSwQ@mail.gmail.com>
X-Gm-Features: AVHnY4LvFbNiK24-FvCoE3twpmk9aXIsCekaEcBReuJVWk43ZFHEDaIzY97UT0Q
Message-ID: <CAAhV-H4kxm-yfgxkxo+8NTvcRtz=uc8G0iTuKEbynkB6pMBSwQ@mail.gmail.com>
Subject: Re: Ping: [PATCH v2] LoongArch: detect and disable sc.q if erratic
To: Xi Ruoyao <xry111@xry111.site>
Cc: WANG Xuerui <kernel@xen0n.name>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	loongarch@lists.linux.dev, Zixing Liu <liushuyu@aosc.io>, 
	Mingcong Bai <jeffbai@aosc.io>, Arnd Bergmann <arnd@arndb.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	George Guo <dongtai.guo@linux.dev>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Ruoyao,

On Mon, Apr 27, 2026 at 10:17=E2=80=AFAM Xi Ruoyao <xry111@xry111.site> wro=
te:
>
> Ping.
Can we keep this as an out-of-tree patch? It's a bit ugly and I think
the corrct way is update firmware.

Huacai

>
> On Thu, 2026-04-09 at 20:19 +0800, Xi Ruoyao wrote:
> > We've observed that, on some Loongson 2K3000/3B6000M systems with earli=
er
> > firmware revisions, the sc.q instruction may write incorrect data into
> > the upper half of the written 128-bit datum.
> >
> > It seems upgrading the firmware (for example, the 202602 release from
> > Loongson [1]) will resolve the issue. But since not all systems may be
> > running the most up-to-date firmware, based on firmware update avail-
> > ability and the environment in which they are running in.
> >
> > To help with system compatibility and ensure correct behavior, check if
> > sc.q behaves erratically and disable if so.
> >
> > Link: https://github.com/loongson/Firmware/pull/156 [1]
> > Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> > ---
> >  arch/loongarch/kernel/cpu-probe.c | 39 ++++++++++++++++++++++++++++++-
> >  1 file changed, 38 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/=
cpu-probe.c
> > index 657bbae6c1c7..5fcf2672172f 100644
> > --- a/arch/loongarch/kernel/cpu-probe.c
> > +++ b/arch/loongarch/kernel/cpu-probe.c
> > @@ -132,6 +132,43 @@ static void set_isa(struct cpuinfo_loongarch *c, u=
nsigned int isa)
> >       }
> >  }
> >
> > +/*
> > + * Some LoongArch has broken sc.q which incorrectly handles the upper =
word
> > + * when the lower word is zero. Newer firmware versions (such as the 2=
02602
> > + * release from Loongson) seem to contain a workaround for this issue.
> > + *
> > + * Disable sc.q if erratic to ensure reliability and compatibility.
> > + */
> > +static bool sc_q_is_sane(void)
> > +{
> > +     struct {
> > +             long word[2];
> > +     } __aligned(16) mem;
> > +     register long tmp asm("t0");
> > +     register long one asm("t1") =3D 1;
> > +     register long *ptr asm("t2") =3D &mem.word[0];
> > +
> > +     /*
> > +      * The sc.q instruction is hard coded with .word so the HWCAP bit
> > +      * exported to the userspace won't depend on the assembler versio=
n
> > +      * used to build the kernel.
> > +      */
> > +     asm (
> > +             "1:ll.d\t$r0, %[ptr], 0\n\t"
> > +             "move\t%[tmp], $r0\n\t"
> > +             ".word\t0x385735cc\n\t" /* sc.q %[tmp], %[one], %[ptr]*/
> > +             "beqz\t%[tmp], 1b"
> > +             : [tmp] "=3D&r" (tmp), "=3Dm" (mem)
> > +             : [ptr] "r" (ptr), [one] "r" (one));
> > +
> > +     if (mem.word[1] !=3D 1) {
> > +             pr_warn_once("Warning: sc.q is erratic on this platform, =
disabling for both kernel and HWCAP. Please try a firmware update.");
> > +             return false;
> > +     }
> > +
> > +     return true;
> > +}
> > +
> >  static void cpu_probe_common(struct cpuinfo_loongarch *c)
> >  {
> >       unsigned int config;
> > @@ -177,7 +214,7 @@ static void cpu_probe_common(struct cpuinfo_loongar=
ch *c)
> >               c->options |=3D LOONGARCH_CPU_LAM;
> >               elf_hwcap |=3D HWCAP_LOONGARCH_LAM;
> >       }
> > -     if (config & CPUCFG2_SCQ) {
> > +     if ((config & CPUCFG2_SCQ) && sc_q_is_sane()) {
> >               c->options |=3D LOONGARCH_CPU_SCQ;
> >               elf_hwcap |=3D HWCAP_LOONGARCH_SCQ;
> >       }
>
> --
> Xi Ruoyao <xry111@xry111.site>
