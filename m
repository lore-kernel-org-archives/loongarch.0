Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F281DCB9
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 18:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91EBC433C9
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 18:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686939556;
	bh=JYIeppGROaSwt5RJCAxNQJPfExACzvun2YHFgIEWjL0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h1uz7zEMjuJtrPfng9729hhzwKLZAjy1ewqpDHwBM6x8slzfWprGf0O18yD5YM5Nd
	 lGrbrUrowo9fDsb+lAOGvAoWnDAfAP5J79owCfLrI9X6tYLpbi9XoI/UAuwzwNAGKp
	 uS2fXdigB5ECiLhk9agV7m4/pIaJenGLNQYxRfmC8jcc5SDlatuAxyWZyrfx5KCZ4C
	 nAgUv4yGMGNtBZL5hST5LlW8srRPQlrEhkQRyfWOF1UvUbQZZnfFHC0ywkpWTYZo57
	 g84yWxoWvPkR8+3GDTr2jisfGnTD+BA+9Ava4iBdRwGPmWHh5AEmmZ6ZirDhevOKEH
	 CpiF+nCdw7SpQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4f762b3227dso1369024e87.1
        for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 11:19:16 -0700 (PDT)
X-Gm-Message-State: AC+VfDzCxMzGsjF0mfikUbpNxRrHmvNFKtFIyvj6adROKZyYCLURz9UR
	24fi36ywtKIjfdoOEPnrYOyMv5wyseZttI01LVI=
X-Google-Smtp-Source: ACHHUZ6PUs5qG5gEz0Ui+rYTOBYo1CNjp/5QXhNKC7wMrP1gtK8A+svd4/31TT3PuRRLSD+QiqJSaxjJua7jMaFtZ74=
X-Received: by 2002:ac2:4c4c:0:b0:4f6:3ef3:13e8 with SMTP id
 o12-20020ac24c4c000000b004f63ef313e8mr2671938lfk.0.1686939533810; Fri, 16 Jun
 2023 11:18:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-3-rppt@kernel.org>
 <ZIySQgafdTHk5Yet@moria.home.lan>
In-Reply-To: <ZIySQgafdTHk5Yet@moria.home.lan>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 11:18:41 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5hnH3Tq+rO1XJEAieDtr61xHBDRmp+C5zRYV5ajRcDFQ@mail.gmail.com>
Message-ID: <CAPhsuW5hnH3Tq+rO1XJEAieDtr61xHBDRmp+C5zRYV5ajRcDFQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] mm: introduce execmem_text_alloc() and jit_text_alloc()
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "David S. Miller" <davem@davemloft.net>, 
	Dinh Nguyen <dinguyen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nadav Amit <nadav.amit@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Puranjay Mohan <puranjay12@gmail.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell King <linux@armlinux.org.uk>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2023 at 9:48=E2=80=AFAM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Fri, Jun 16, 2023 at 11:50:28AM +0300, Mike Rapoport wrote:
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> >
> > module_alloc() is used everywhere as a mean to allocate memory for code=
.
> >
> > Beside being semantically wrong, this unnecessarily ties all subsystems
> > that need to allocate code, such as ftrace, kprobes and BPF to modules
> > and puts the burden of code allocation to the modules code.
> >
> > Several architectures override module_alloc() because of various
> > constraints where the executable memory can be located and this causes
> > additional obstacles for improvements of code allocation.
> >
> > Start splitting code allocation from modules by introducing
> > execmem_text_alloc(), execmem_free(), jit_text_alloc(), jit_free() APIs=
.
> >
> > Initially, execmem_text_alloc() and jit_text_alloc() are wrappers for
> > module_alloc() and execmem_free() and jit_free() are replacements of
> > module_memfree() to allow updating all call sites to use the new APIs.
> >
> > The intention semantics for new allocation APIs:
> >
> > * execmem_text_alloc() should be used to allocate memory that must resi=
de
> >   close to the kernel image, like loadable kernel modules and generated
> >   code that is restricted by relative addressing.
> >
> > * jit_text_alloc() should be used to allocate memory for generated code
> >   when there are no restrictions for the code placement. For
> >   architectures that require that any code is within certain distance
> >   from the kernel image, jit_text_alloc() will be essentially aliased t=
o
> >   execmem_text_alloc().
> >
> > The names execmem_text_alloc() and jit_text_alloc() emphasize that the
> > allocated memory is for executable code, the allocations of the
> > associated data, like data sections of a module will use
> > execmem_data_alloc() interface that will be added later.
>
> I like the API split - at the risk of further bikeshedding, perhaps
> near_text_alloc() and far_text_alloc()? Would be more explicit.
>
> Reviewed-by: Kent Overstreet <kent.overstreet@linux.dev>

Acked-by: Song Liu <song@kernel.org>
