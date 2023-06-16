Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08E11EA84
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 20:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66CF4C433C0
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 20:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686945964;
	bh=WtL681uu0xgDuNDCtnoYcQSLjySma9uSe62fWHoJUhA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AcGzpwhCVXiRwm5j4OFssmceLRtEzXnUiDmPG4bZAhQ1+qmDfwsSBQi9M1G03XxmY
	 2NqgdUROOACLyDWCMR6Dzf3s8/77OqggVC2YW96iuM0uQUVUkds7P2ZnSASS/5H85N
	 AhziQX38Ss4f7TmXzjmKqZ28rkOJaaicK0yEpCCMwzCcgv9I1+vu57P7gvhXoES8mO
	 GbYLkYl0AhxmRAwFtYsgJx0/oq1sL4/rVSlkeJUIi1iL+LTDVZ5f1jRc5Cg0d9Nwww
	 B1rTpDL9KwW5thTr/zb81eYPefVEgm/Z0mvsLznrDHVAYl44680M1OsCL/FaP4gmzW
	 eIEO+Adul3xbA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b3500a1f2bso15691201fa.2
        for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 13:06:04 -0700 (PDT)
X-Gm-Message-State: AC+VfDzzZ6UQOeiOAZN6Yo5Sti+lV8rc4jHoshfiwIzpM6Lv1FST/1+0
	n1wTQ2sJd47BzWuBM0GZNSAllYW4hCkklI5tWwY=
X-Google-Smtp-Source: ACHHUZ7v0OG7lj710Dpkky2x3Qwl+xOOMZ2WmKSKGrGJ24Aq4/yPm9YniFAuyGWs2DWPlG6NvD65kdAaVeIKyOd6PQ8=
X-Received: by 2002:a19:644e:0:b0:4e9:9e45:3470 with SMTP id
 b14-20020a19644e000000b004e99e453470mr2381818lfj.3.1686945941704; Fri, 16 Jun
 2023 13:05:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-8-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-8-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 13:05:29 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6BG2oVrGDOpCKyOEvU9fBOboYYhducv96KUBe276Mvng@mail.gmail.com>
Message-ID: <CAPhsuW6BG2oVrGDOpCKyOEvU9fBOboYYhducv96KUBe276Mvng@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] arm64, execmem: extend execmem_params for
 generated code definitions
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
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

On Fri, Jun 16, 2023 at 1:52=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> The memory allocations for kprobes on arm64 can be placed anywhere in
> vmalloc address space and currently this is implemented with an override
> of alloc_insn_page() in arm64.
>
> Extend execmem_params with a range for generated code allocations and
> make kprobes on arm64 use this extension rather than override
> alloc_insn_page().
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
>  arch/arm64/kernel/module.c         |  9 +++++++++
>  arch/arm64/kernel/probes/kprobes.c |  7 -------
>  include/linux/execmem.h            | 11 +++++++++++
>  mm/execmem.c                       | 14 +++++++++++++-
>  4 files changed, 33 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> index c3d999f3a3dd..52b09626bc0f 100644
> --- a/arch/arm64/kernel/module.c
> +++ b/arch/arm64/kernel/module.c
> @@ -30,6 +30,13 @@ static struct execmem_params execmem_params =3D {
>                         .alignment =3D MODULE_ALIGN,
>                 },
>         },
> +       .jit =3D {
> +               .text =3D {
> +                       .start =3D VMALLOC_START,
> +                       .end =3D VMALLOC_END,
> +                       .alignment =3D 1,
> +               },
> +       },
>  };

This is growing fast. :) We have 3 now: text, data, jit. And it will be
5 when we split data into rw data, ro data, ro after init data. I wonder
whether we should still do some type enum here. But we can revisit
this topic later.

Other than that

Acked-by: Song Liu <song@kernel.org>
