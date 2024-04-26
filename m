Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DA6BE47
	for <loongarch@lists.linux.dev>; Fri, 26 Apr 2024 19:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714158127; cv=none; b=XfsK6nu9t8lqZ7dlSsggAizqg9o2e9keWufzNxB1yig28CsbfD2fp/3sxHB7/li7s/YzbPR0+FPQlXvxxXQk2or3wqMtu0WkZiz51OY0WOFPv1h6rV48ZGgyw0ePz1Ckx+L+obQJxXEAbYfyXvxJ1B7e80Apgtjmou0QIIX9/6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714158127; c=relaxed/simple;
	bh=spHwlcTCpaNA543nwyK0H2eAD2T0c3htMv4UjyBqffA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lWUHEd60JMpiG6Y3Hgsk6vNw6bef6DAPSQVHi+iNQzFcTypasYVP/CmMmj2Avyp8abCXtlejNh3WtsLeHD3DMAEjD3qVRqg//iwQgtwSQWWX+4MhkCDZVvLyZqozWqcfL2sG86j1aGBLRREFTcLkOPkQqn0STqCnSLMAMKze6Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDwUF1ww; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDwUF1ww"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F57BC2BD10
	for <loongarch@lists.linux.dev>; Fri, 26 Apr 2024 19:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714158127;
	bh=spHwlcTCpaNA543nwyK0H2eAD2T0c3htMv4UjyBqffA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CDwUF1wwCETAxLtRi23wdiAMyaCf927GHJuMUzch8wggRG10M/ldtSEWzl2LqT66b
	 5FaiC+JRZufcIN0qjqYB+UOPyg31sMqZvIjIad00q7zJsA+kGQwM1SxHWU7+CmyGM9
	 KbolWjcRUPZ5wAUSzSezPgU8dJnZdhbYtBzqRAN71i8ivZ1HvOzwKg7ocXRIWrVWUc
	 EmB7b+wQr7R1yyTthw9Qej1s5cDAuY8ycLn0WdOvyvhWtAXBhU5NsuE3LSBqPa7Xyj
	 a+Xy18Y8XArpz+b0LjIvvvKnrY6p5B9B3PUQaR8Dyh/cc/dfiwvF+euiak/GDCcOFj
	 VSUm0CNnF56pw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-516d68d7a8bso2322100e87.1
        for <loongarch@lists.linux.dev>; Fri, 26 Apr 2024 12:02:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9xToRF8lLod0rUmuSLhkFbdD/lTTaVUMWlQL1tShwAR/eYQnCJF+48XFJpZUF9p29+G+jj7y1WUXqkUTgzEfDexxIpXaSh1Jc
X-Gm-Message-State: AOJu0Yxs/NE6Ify6F1f/pJS5O4K26C5yhOtbMlmfaV62YEOFBOi1vw1n
	ptgzeakp15AuVgoSp8b/kwZ9V+P0trlhadjW2SoW3FuorJozRg53l0uZN1e7MusXQTAEvM0AsNR
	GikGitd/FQLNr8JlyqyU4yAVgPs4=
X-Google-Smtp-Source: AGHT+IF/3UI9Cwbb8z8OI8jFmskqzepU4aeg2+YglDD7FKhfHPiRdUcmMxLF73Ba/yVMMyprkxylEY00eIaasdUhAvE=
X-Received: by 2002:a05:6512:151:b0:513:c1a2:d380 with SMTP id
 m17-20020a056512015100b00513c1a2d380mr1420572lfo.31.1714158105499; Fri, 26
 Apr 2024 12:01:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240426082854.7355-1-rppt@kernel.org> <20240426082854.7355-9-rppt@kernel.org>
In-Reply-To: <20240426082854.7355-9-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 26 Apr 2024 12:01:34 -0700
X-Gmail-Original-Message-ID: <CAPhsuW52MYy4Md5O=7XVGvkw395-LB+BiSadxoDdw8CrLw5t7A@mail.gmail.com>
Message-ID: <CAPhsuW52MYy4Md5O=7XVGvkw395-LB+BiSadxoDdw8CrLw5t7A@mail.gmail.com>
Subject: Re: [PATCH v6 08/16] mm/execmem, arch: convert remaining overrides of
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
> Extend execmem parameters to accommodate more complex overrides of
> module_alloc() by architectures.
>
> This includes specification of a fallback range required by arm, arm64
> and powerpc, EXECMEM_MODULE_DATA type required by powerpc, support for
> allocation of KASAN shadow required by s390 and x86 and support for
> late initialization of execmem required by arm64.
>
> The core implementation of execmem_alloc() takes care of suppressing
> warnings when the initial allocation fails but there is a fallback range
> defined.
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> Acked-by: Will Deacon <will@kernel.org>

nit: We should probably move the logic for ARCH_WANTS_EXECMEM_LATE
to a separate patch.

Otherwise,

Acked-by: Song Liu <song@kernel.org>
