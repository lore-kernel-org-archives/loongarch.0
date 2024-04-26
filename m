Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21321D540
	for <loongarch@lists.linux.dev>; Fri, 26 Apr 2024 18:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714157679; cv=none; b=SiY/OirVSTQISpX758KtCR1oynHp1b2+/F0AJOOFY0bN2PM6YxwqDrL1d15kl8oTzKc87g89B+zMylUel7axkCcntlEb4+jI0ataZw5WJ6+jkMnyNSPNwiUo2Bw9b3xJizK7m9tJLooHJfwTD9XNmGOMFsHQqmSmHydwaK7mRX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714157679; c=relaxed/simple;
	bh=Erw8uuVUeGio0PshYx2zkVsumWpV4GynBPxpYdsctHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f6xm70Zj9ny2Hijhf2f/ckxTCAIW7pnngFati5twSqXPMtcKT7fLCCqdOmhogTfjkRD4Hok6ZXHIslSIloTpCbFnvgi43xJlp/iACEaNhA3jXWV8y6zCQqIkUrjciDcwR7VsGadr0AZkIadOLU03qK9F15FpDrIL4113Cur9Z7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QeY0Q5CW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QeY0Q5CW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F785C32782
	for <loongarch@lists.linux.dev>; Fri, 26 Apr 2024 18:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714157679;
	bh=Erw8uuVUeGio0PshYx2zkVsumWpV4GynBPxpYdsctHY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QeY0Q5CWKGUNkZV4cnTSE1WS5+eVGN0gFY1x99TWFJOz/NVZq+OjKksNbrH0CcX/L
	 aFsWENgqvWMDoRx0SH9KLjE4OC22Bf5Qa/YglImk9bxrHhpE1cvJ4rGWoP1CmD3tyx
	 5GVQHrCTqQ4hMaUzd/bPyc6futZG+WNd5KuMCzBntmiQO9LBrcntwqDWmLag8UFFnd
	 KJjIeprHGBh5VFeH8ex6x8CUqFgQgt00rSl+aepgBxkP4M7ne4NCshtRBFGFAtb0T3
	 ag90uwhMbViW+NGATzyAcLeYJJ3m5AxjLrtmYQZ6+zQePK+mZWBptrLFWzXfkeMx7C
	 kFKBeHGA1rHAw==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a559b919303so323435866b.1
        for <loongarch@lists.linux.dev>; Fri, 26 Apr 2024 11:54:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVKj1+GiZ/5384ItGq9J7Y8N1cqawqjvCLkH72ujjcIwlOQ1CatBx7qQ6CEm3BPkDaTnPs12EToWRExlPCwGqrLJPRiXQTqKgA
X-Gm-Message-State: AOJu0YxvDVkG31ALe3EDprYYk7u/2oPg21JFIACTZT9qAERJ1o8IWFID
	IDLJrYTQn2gZhJEwEVPAklRCn7KWEJoGfjWJpjI9KmywzNdhOWyKo6CS2buC+E2NU1znSNCL6YM
	tExWWlxrxy/w8UES0mRAdPAzWdak=
X-Google-Smtp-Source: AGHT+IHR8dCzuYaMcfUu9DJ1W7DJuyt98T5r37UenPfdlzP0RlXEYGrXPEenPo3iSsrLDDgw6B5I00dbfOalDiVdMh8=
X-Received: by 2002:ac2:5202:0:b0:51c:1fb4:2327 with SMTP id
 a2-20020ac25202000000b0051c1fb42327mr2189866lfl.24.1714157657105; Fri, 26 Apr
 2024 11:54:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240426082854.7355-1-rppt@kernel.org> <20240426082854.7355-8-rppt@kernel.org>
In-Reply-To: <20240426082854.7355-8-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 26 Apr 2024 11:54:06 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7+wmDA_aaZKhNLfEZ-F1aLpUKssXqu5tUs6s=P9yvB-Q@mail.gmail.com>
Message-ID: <CAPhsuW7+wmDA_aaZKhNLfEZ-F1aLpUKssXqu5tUs6s=P9yvB-Q@mail.gmail.com>
Subject: Re: [PATCH v6 07/16] mm/execmem, arch: convert simple overrides of
 module_alloc to execmem
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Donald Dutile <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit <nadav.amit@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell King <linux@armlinux.org.uk>, 
	Sam Ravnborg <sam@ravnborg.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Will Deacon <will@kernel.org>, bpf@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 1:30=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> Several architectures override module_alloc() only to define address
> range for code allocations different than VMALLOC address space.
>
> Provide a generic implementation in execmem that uses the parameters for
> address space ranges, required alignment and page protections provided
> by architectures.
>
> The architectures must fill execmem_info structure and implement
> execmem_arch_setup() that returns a pointer to that structure. This way t=
he
> execmem initialization won't be called from every architecture, but rathe=
r
> from a central place, namely a core_initcall() in execmem.
>
> The execmem provides execmem_alloc() API that wraps __vmalloc_node_range(=
)
> with the parameters defined by the architectures.  If an architecture doe=
s
> not implement execmem_arch_setup(), execmem_alloc() will fall back to
> module_alloc().
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

Acked-by: Song Liu <song@kernel.org>
