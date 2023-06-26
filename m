Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40B8134AB
	for <loongarch@lists.linux.dev>; Mon, 26 Jun 2023 17:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7C2C433CA
	for <loongarch@lists.linux.dev>; Mon, 26 Jun 2023 17:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687801751;
	bh=fFWuzhLLiGkinhaWeToFLkDX/dcx5OWER83aW8VgRow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gsu5wtN50LZdJATM3ZjDYRwk1wnL4zKmLVdDqqUpcLtSNYlPt2g8EOd2+LHOYG0G5
	 HJb6UdQ1uCsnI8e7N++rgev5m4nSa6GuRAJ1KqvHYFOZQchtOemxBOGvfMG1j5Osdd
	 gV8aBmKXzrC6Q+VYPFHx1qXffUm36IuFITg1YCCjupG+JYtQ7Ki6FGlI1JCtnPafXG
	 BflN3PH1aFSJcZb5/HVOZxfkzz3hTosSHdnVSJwFszzWNxojXWnuwt26Kb9cys6I2L
	 Z/dJc0eQyaMVi232VXzASC5AOFcr+LZ8Z/R0k5jXoEQbxTh4I/aMaqIE8NWBVDE9Ir
	 WJbgxGOvJGyQg==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so8364096a12.0
        for <loongarch@lists.linux.dev>; Mon, 26 Jun 2023 10:49:11 -0700 (PDT)
X-Gm-Message-State: AC+VfDw5W4Si32S+u3ewkj5esT9oLQEsvafdY/+/4RIQQh9iyI+N68yY
	wE2SU7iJK0tDUFr4NDmd5fWUK6eJtrYFSxEU9j4=
X-Google-Smtp-Source: ACHHUZ6w6e1OYy7QM9S+YTdK71Dx4cd9s642AcRaJSfPZb8UXF8n/hvi2zuHhdV8C7DcTgUpaxVtcUwpuH0YchvBFOg=
X-Received: by 2002:a19:5f5d:0:b0:4f8:5e62:b94b with SMTP id
 a29-20020a195f5d000000b004f85e62b94bmr8655403lfj.9.1687801729333; Mon, 26 Jun
 2023 10:48:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-3-rppt@kernel.org>
 <f9a7eebe-d36e-4587-b99d-35d4edefdd14@app.fastmail.com> <20230618080027.GA52412@kernel.org>
 <a17c65c6-863f-4026-9c6f-a04b659e9ab4@app.fastmail.com> <20230625161417.GK52412@kernel.org>
 <ZJmFFmexl_1GUhIL@FVFF77S0Q05N>
In-Reply-To: <ZJmFFmexl_1GUhIL@FVFF77S0Q05N>
From: Song Liu <song@kernel.org>
Date: Mon, 26 Jun 2023 10:48:37 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4pDkd7rCWRM6938ve36rfhGxyu=8t1-GjcKnNajofpQA@mail.gmail.com>
Message-ID: <CAPhsuW4pDkd7rCWRM6938ve36rfhGxyu=8t1-GjcKnNajofpQA@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] mm: introduce execmem_text_alloc() and jit_text_alloc()
To: Mark Rutland <mark.rutland@arm.com>
Cc: Mike Rapoport <rppt@kernel.org>, Andy Lutomirski <luto@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit <nadav.amit@gmail.com>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Puranjay Mohan <puranjay12@gmail.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"Russell King (Oracle)" <linux@armlinux.org.uk>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Will Deacon <will@kernel.org>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, 
	"the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 26, 2023 at 5:31=E2=80=AFAM Mark Rutland <mark.rutland@arm.com>=
 wrote:
>
[...]
> >
> > So the idea was that jit_text_alloc() will have a cache of large pages
> > mapped ROX, will allocate memory from those caches and there will be
> > jit_update() that uses text poking for writing to that memory.
> >
> > Upon allocation of a large page to increase the cache, that large page =
will
> > be "invalidated" by filling it with breakpoint instructions (e.g int3 o=
n
> > x86)
>
> Does that work on x86?
>
> That is in no way gauranteed for other architectures; on arm64 you need
> explicit cache maintenance (with I-cache maintenance at the VA to be exec=
uted
> from) followed by context-synchronization-events (e.g. via ISB instructio=
ns, or
> IPIs).

I guess we need:
1) Invalidate unused part of the huge ROX pages;
2) Do not put two jit users (including module text, bpf, etc.) in the
same cache line;
3) Explicit cache maintenance;
4) context-synchronization-events.

Would these (or a subset of them) be sufficient to protect us from torn rea=
d?

Thanks,
Song
