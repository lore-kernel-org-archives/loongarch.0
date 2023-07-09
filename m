Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C0917E1
	for <loongarch@lists.linux.dev>; Sun,  9 Jul 2023 03:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE15C433C7
	for <loongarch@lists.linux.dev>; Sun,  9 Jul 2023 03:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688874968;
	bh=7DPhvYhEG3m2WY9+vazYC8djvRRt8K9rL/HKTxj0QS8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PKcvWCrU0I1pDFybPh+gUUOW+JBjRqBcmIXX8QshmDuifdSsa1JfsNJ064wFem7Q7
	 it7laySnxli942qTAg6dWko4yzeSFSfahQd3qVpVHz97afiuDTENsAgtNt8xgrIBJH
	 LcfEQLYsTWXmwYlKvqel7yYQ94bIhJ+M2m8SeSbRkwI0HhYWwYnj80X+VlDsy0bYr4
	 Nd7zykQ/Lfnq9HJ1HPMK742detZykJzCoutfGenxypm+0IckyGY6SJ9c+ACKrorVMf
	 VV35cx2LEfRw4c9WFoRR7oJuliXV2sh1idJVirY4i7c2/duzoKpaFHgsv2ZBsLDLyf
	 dT5gRyIb8veQQ==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-51d7f350758so4557782a12.3
        for <loongarch@lists.linux.dev>; Sat, 08 Jul 2023 20:56:08 -0700 (PDT)
X-Gm-Message-State: ABy/qLbfpBWifVUY6jXHNPrthyaC8RWMPSJskwzfFtP7U+EWNvqjWEeg
	7gnNnlPKA0VI/llBAcCiSZXcaKyb9UE6dma4zyg=
X-Google-Smtp-Source: APBJJlHekp1NZpVGYtjvcGTs34USKI+d2GvSLwRaINxjnYwlGXftr8692oNNQ8CRQjMLp4fs1jG3dXkGNdBZs1/JNYY=
X-Received: by 2002:aa7:c0c6:0:b0:51e:166a:ac7f with SMTP id
 j6-20020aa7c0c6000000b0051e166aac7fmr7183978edp.28.1688874966365; Sat, 08 Jul
 2023 20:56:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1688369658.git.chenfeiyang@loongson.cn> <8d10b1220434432dbc089fab8df4e1cca048cd0c.1688369658.git.chenfeiyang@loongson.cn>
In-Reply-To: <8d10b1220434432dbc089fab8df4e1cca048cd0c.1688369658.git.chenfeiyang@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 9 Jul 2023 11:55:55 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4yaJExw8zSYvEiHaXQJXfCkmwa4yuFfrrT51QT_25NJw@mail.gmail.com>
Message-ID: <CAAhV-H4yaJExw8zSYvEiHaXQJXfCkmwa4yuFfrrT51QT_25NJw@mail.gmail.com>
Subject: Re: [PATCH 2/2] LoongArch: Allow building with kcov coverage
To: Feiyang Chen <chenfeiyang@loongson.cn>
Cc: dvyukov@google.com, andreyknvl@gmail.com, loongarch@lists.linux.dev, 
	kasan-dev@googlegroups.com, chris.chenfeiyang@gmail.com, 
	loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Feiyang,

Please update Documentation/features/debug/kcov/arch-support.txt, thanks.

Huacai

On Tue, Jul 4, 2023 at 8:53=E2=80=AFPM Feiyang Chen <chenfeiyang@loongson.c=
n> wrote:
>
> Add ARCH_HAS_KCOV to the LoongArch Kconfig. Also disable
> instrumentation of vdso.
>
> Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
> ---
>  arch/loongarch/Kconfig       | 1 +
>  arch/loongarch/vdso/Makefile | 2 ++
>  2 files changed, 3 insertions(+)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index ed9a148cdcde..4c21a961ab88 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -14,6 +14,7 @@ config LOONGARCH
>         select ARCH_HAS_ACPI_TABLE_UPGRADE      if ACPI
>         select ARCH_HAS_CPU_FINALIZE_INIT
>         select ARCH_HAS_FORTIFY_SOURCE
> +       select ARCH_HAS_KCOV
>         select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
>         select ARCH_HAS_PTE_SPECIAL
>         select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
> diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
> index 7bb794604af3..7dc87377688b 100644
> --- a/arch/loongarch/vdso/Makefile
> +++ b/arch/loongarch/vdso/Makefile
> @@ -5,6 +5,8 @@ ifdef CONFIG_KASAN
>  KASAN_SANITIZE :=3D n
>  endif
>
> +KCOV_INSTRUMENT :=3D n
> +
>  # Include the generic Makefile to check the built vdso.
>  include $(srctree)/lib/vdso/Makefile
>
> --
> 2.39.3
>
