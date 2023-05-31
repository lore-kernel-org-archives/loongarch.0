Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E609AAD5F
	for <loongarch@lists.linux.dev>; Wed, 31 May 2023 07:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99141C433EF
	for <loongarch@lists.linux.dev>; Wed, 31 May 2023 07:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685519934;
	bh=hxbnFvcj7klXi6leW6SPHVzuX3D3k7k/GJnOipo4VjY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lljgg1R599BIJ8UtybuoA97k+0L4KeMVPyIqnfFKki8Ns0uqVoWdDZn+Qbc3zLvfl
	 nX61Hd7Cl51sG2HF1hhTMBsueHfx9bWk1iOddbKCZN2XAJLTIaH88zcR4eMmTAWvzb
	 d2hG7lOtOcAN/FbOOlSPrPqacQpqjtIp2B0teIH2d8j8EXA8NQ2Qjp7WB0rz5Go8g0
	 tUuZVjSiXmFSlO/3QNPP/nCWHYSzGGoo99rhkX8nyuI6ZuqaVsnHHb9+QWr0BdyrKN
	 yC8rgb+88UUzeEry7PkepdYjTtEYYw6Ln7iaDe82+XxX6O4Ih0CKzlwhmLYzlr8ftf
	 qVlB1xmLX40Ig==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9741caaf9d4so264757666b.0
        for <loongarch@lists.linux.dev>; Wed, 31 May 2023 00:58:54 -0700 (PDT)
X-Gm-Message-State: AC+VfDzA0b91/QYXl5gEq0kosPgHGAuUoVFaTjV1JrYRc3gBpYanw/vs
	j+t4PMgwxu+EK8J6QgguMgHy+bX+V2JRva/H0bI=
X-Google-Smtp-Source: ACHHUZ6ce3rGf8/cAdUYD+pV3Jetxof+lyoNKkYs03+HB1sOw6oKrTpikbqjJQ2lE/oe44I3VYEHa46ipGRWJ59yeBk=
X-Received: by 2002:a17:907:7ea1:b0:96a:e7cc:b8b1 with SMTP id
 qb33-20020a1709077ea100b0096ae7ccb8b1mr4200648ejc.56.1685519932849; Wed, 31
 May 2023 00:58:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1685441401-8709-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1685441401-8709-1-git-send-email-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 31 May 2023 15:58:41 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7EjxoVg_FAV2hTAKjZYJJEeHiDcfo21=z3OYstboSvxw@mail.gmail.com>
Message-ID: <CAAhV-H7EjxoVg_FAV2hTAKjZYJJEeHiDcfo21=z3OYstboSvxw@mail.gmail.com>
Subject: Re: [PATCH RESEND v3 0/5] perf tools: Modify mksyscalltbl
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For the whole series,
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Tue, May 30, 2023 at 6:10=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> I'm sorry, somehow the patchset didn't reach mailing lists.
> Resending with a fewer people in the cc list, which probably
> was the reason.
>
> Thanks Alexander, Leo and Ian for your reviews and suggestions.
>
> v3:
>   -- Add a new patch to declare syscalltbl_*[] as const for all archs,
>      suggested by Ian.
>   -- Add a new patch to use max_nr to define SYSCALLTBL_ARM64_MAX_ID.
>
> v2:
>   -- Add a new patch to rename create_table_from_c()
>      to create_sc_table(), suggested by Leo.
>   -- Simplify the shell script, suggested by Alexander.
>
> Tiezhu Yang (5):
>   perf tools: Declare syscalltbl_*[] as const for all archs
>   perf arm64: Rename create_table_from_c() to create_sc_table()
>   perf arm64: Handle __NR3264_ prefixed syscall number
>   perf arm64: Use max_nr to define SYSCALLTBL_ARM64_MAX_ID
>   perf LoongArch: Simplify mksyscalltbl
>
>  tools/perf/arch/arm64/entry/syscalls/mksyscalltbl  | 17 ++++-----
>  .../arch/loongarch/entry/syscalls/mksyscalltbl     | 40 +++++++---------=
------
>  tools/perf/arch/mips/entry/syscalls/mksyscalltbl   |  2 +-
>  .../perf/arch/powerpc/entry/syscalls/mksyscalltbl  |  2 +-
>  tools/perf/arch/s390/entry/syscalls/mksyscalltbl   |  2 +-
>  tools/perf/arch/x86/entry/syscalls/syscalltbl.sh   |  2 +-
>  tools/perf/util/syscalltbl.c                       | 14 ++++----
>  7 files changed, 32 insertions(+), 47 deletions(-)
>
> --
> 2.1.0
>
>
