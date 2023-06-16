Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E201101F6
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 18:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7250C433CA
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 18:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686940626;
	bh=JGylOLwsDlnOC/7zFFXP8rSDvCyOTlCYNV6rWd4f8mw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Yz3z2zPPzHFCJcQtJOMaXjWa8GA8mQAeW8LM7bjbVNlYM8WBRY7CjTOW/I1g0EcM8
	 vRoVIlo5a3UMluk4nxmNxrkOKPLmMbeCjCf51WrJtVl/45yDZNR0FLzUP7NVhjJcWJ
	 qCKqQzPCVKBXL+hGguZv4eEQari5OoY305U89aDLJhmxkFWiUGDgkZVeo9UZADDDdn
	 c/oKqnca9Go3WkYBTNkLIBWVDD6ev81rCopZ/SqoK9DdKTbar+KmPJG/RUO0iNwUwj
	 Ro806O4psMMkJKFBAUTfUNBZ/iwBAONqIpsxFib/sBxwNQlktglWwepG/kBcr3tb/r
	 WvJA+ZFnNF95g==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-986bfdfe8d4so90825966b.1
        for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 11:37:06 -0700 (PDT)
X-Gm-Message-State: AC+VfDzDWLnswtY0342eYNSeQQZxNbO42FafsvmaeYGo6MdLnTumUQtd
	TGQsvJpMFeiSkCH4PxLC+JihGyhH2xrJWDAQB+I=
X-Google-Smtp-Source: ACHHUZ7VgWfSxd734IfkdiKrgB+GJm0nBxE0sk2dQ8TAn5f7aSo4Y23dXvE8MnzKke3G84UjJ1bhxQV9PGC+v71U+NE=
X-Received: by 2002:a19:7913:0:b0:4f3:aa81:2a6e with SMTP id
 u19-20020a197913000000b004f3aa812a6emr797084lfc.19.1686940604495; Fri, 16 Jun
 2023 11:36:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-4-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-4-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 11:36:32 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6tDvY5G-qGMq3ymth3ip27=zAij8_UhJ-qP6Ct1U1-ZA@mail.gmail.com>
Message-ID: <CAPhsuW6tDvY5G-qGMq3ymth3ip27=zAij8_UhJ-qP6Ct1U1-ZA@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] mm/execmem, arch: convert simple overrides of
 module_alloc to execmem
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

On Fri, Jun 16, 2023 at 1:51=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> Several architectures override module_alloc() only to define address
> range for code allocations different than VMALLOC address space.
>
> Provide a generic implementation in execmem that uses the parameters
> for address space ranges, required alignment and page protections
> provided by architectures.
>
> The architecures must fill execmem_params structure and implement
> execmem_arch_params() that returns a pointer to that structure. This
> way the execmem initialization won't be called from every architecure,
> but rather from a central place, namely initialization of the core
> memory management.
>
> The execmem provides execmem_text_alloc() API that wraps
> __vmalloc_node_range() with the parameters defined by the architecures.
> If an architeture does not implement execmem_arch_params(),
> execmem_text_alloc() will fall back to module_alloc().
>
> The name execmem_text_alloc() emphasizes that the allocated memory is
> for executable code, the allocations of the associated data, like data
> sections of a module will use execmem_data_alloc() interface that will
> be added later.
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

Acked-by: Song Liu <song@kernel.org>
