Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B811990B3
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 17:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728580712; cv=none; b=ZhdTUh4GA6LM69tpYIVX+5cqJ1YfS8ZxySN6KezvjogB2Y0cUxghRGhhwqVb35Vqp2rM+NWR8NacAwGNzmo3klQqL9bwUUGNYNKoGSB7Uc+fqoIWnJEat2gVHr8hOLyGNBGmnv4FRHvYKdAwwGQRQ6PMctW/Cb/jpDnLv17t5uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728580712; c=relaxed/simple;
	bh=vaucBuX2fMrEpT3kygwI4CcFnWG5blOdj+4yYIH1/lc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VdyUqTy6CptoVSqVgvzdYJMqPU6hJwsDnJ2c5zqIj6cq6ZJnMSFz+hXc2D2YP6Tse4+y88y9zq6qQC1ceGSi9VIEQs4p9Plc0JwM+xWYtQbrO0SE/qLvB32fevMLBuTF7BrXn0G85g2OsFxS51nidUHgDFJa6qrYyTpEbUHrqSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohS2ZEJg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohS2ZEJg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A8DC4CEDE
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 17:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728580712;
	bh=vaucBuX2fMrEpT3kygwI4CcFnWG5blOdj+4yYIH1/lc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ohS2ZEJg9qBuI0SAkSL1XR/EeS8598zu72QfILrMEzXncFKMx6qICQZRdntjMsS/p
	 SS6wjgHM1U93bHcBct/IZh7SgaOrlXJEsw/7AsIN9FDOB9Cim3DKPCD1ZdTCnU+E/9
	 QkNbFKkk7LUWrjaR+6Kko9xboDHUQcQEWDsodeLqwyooH3PFVOCg/3h+jLz/x5fLQf
	 Y40BxFHxbl/QXSOFmytnmoFjUWMjdXm/FX9bkZk7nVSyUFa1ddzH/vzAu9m9Rx8msK
	 AV+ZIMMHAB+Mz9A7bTRR8jxso5y3dofixzeSNtFEgi9wex/HyEj0rlhLqzIp3xQsva
	 QX8SZQu1NQsEw==
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-8354d853f91so32419439f.0
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 10:18:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWFoWY2dZxBuQqXP9LGD8IBQyp41akzqKYmbd5hPUoq15ztFkNcbkZHvtjKwfxXin1M7HVIbkjnfYc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyf1OAgbWY7D2OdpE9AwE9/StgqpedJ8jdCG++QCvDfIZoVxADQ
	era0pE4KWhugZ9J9atkHIrsaRbfyVJV2yu1XUY9SDDuyIEUsK2c5PAHahMeFVpO67tU93FYJ68L
	2LVmuuWDUexPzmmwe5Sh4/2U2gqs=
X-Google-Smtp-Source: AGHT+IGszKBBrf1gYsUhslMqcPNpC/f6sAFFbsmL+u+zGmeEd2sYZs3+7Tvb9T+CKCsx/nhk3yidKvoEgysxI18Lmn4=
X-Received: by 2002:a05:6e02:144d:b0:3a0:92e5:af68 with SMTP id
 e9e14a558f8ab-3a3b51daa94mr2839515ab.15.1728580710921; Thu, 10 Oct 2024
 10:18:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241009180816.83591-1-rppt@kernel.org> <20241009180816.83591-5-rppt@kernel.org>
 <CAPhsuW66etfdU3Fvk0KsELXcgWD6_TkBFjJ-BTHQu5OejDsP2w@mail.gmail.com> <ZwdpnPKKQGF5DtSv@kernel.org>
In-Reply-To: <ZwdpnPKKQGF5DtSv@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 10 Oct 2024 10:18:19 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6gb76T_75TPzb-AvfyAcYE83iYhDpjJNHJQWDd3Fki_Q@mail.gmail.com>
Message-ID: <CAPhsuW6gb76T_75TPzb-AvfyAcYE83iYhDpjJNHJQWDd3Fki_Q@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] module: prepare to handle ROX allocations for text
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@infradead.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Overstreet <kent.overstreet@linux.dev>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, 
	Stafford Horne <shorne@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Uladzislau Rezki <urezki@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, 
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 10:47=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Wed, Oct 09, 2024 at 03:23:40PM -0700, Song Liu wrote:
> > On Wed, Oct 9, 2024 at 11:10=E2=80=AFAM Mike Rapoport <rppt@kernel.org>=
 wrote:
> > [...]
> > > diff --git a/include/linux/module.h b/include/linux/module.h
> > > index 88ecc5e9f523..7039f609c6ef 100644
> > > --- a/include/linux/module.h
> > > +++ b/include/linux/module.h
> > > @@ -367,6 +367,8 @@ enum mod_mem_type {
> > >
> > >  struct module_memory {
> > >         void *base;
> > > +       void *rw_copy;
> > > +       bool is_rox;
> > >         unsigned int size;
> >
> > Do we really need to hold the rw_copy all the time?
>
> We hold it only during module initialization, it's freed in
> post_relocation.

Ah, I missed this part. Sorry for the noise.

Song
