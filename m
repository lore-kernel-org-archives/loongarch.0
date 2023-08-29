Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A715FEC0
	for <loongarch@lists.linux.dev>; Tue, 29 Aug 2023 04:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7470FC433CA
	for <loongarch@lists.linux.dev>; Tue, 29 Aug 2023 04:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693282408;
	bh=zjEphFgb/yvAPz6k3BMSEsKTy6F40wxOWJDC85TABLw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GvhHN38EfEXV32XdObboMjVfgkbR/QR4r6ZPFjQZ5/3b6rLZLKMpdqszWnslItpGw
	 vh/deo4HU0m6uzubSplmR/jHCcpPhFthNyHgqQJNolL6HR+SZRjeIB9jb/RGQ5zYhX
	 ny7SoSjveaBIoHm/Orops9EsQbzwaWWYUvk4Z5F/iCyYHD8EkccN/f5N+/ehAVWhL5
	 Sw6bujLQLLjaJGPYMogSA41Fp5EEUahVsWOtH1ZzOZswcznM/b9FSPjVy1+Tw8I+Jq
	 ysP0ooRRM4OT8CfnwUVkBAoz4nsubox/Rb5l2PJ8WYhPXaOKoe1PAyxTSbws7TTvol
	 6ngDXI28oahpw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2bccda76fb1so59170231fa.2
        for <loongarch@lists.linux.dev>; Mon, 28 Aug 2023 21:13:28 -0700 (PDT)
X-Gm-Message-State: AOJu0YzxEhV11xVMw+D7ub6OKbPQKIpabZalr3CtKfAfCR8bQnP2yTj7
	3390eAx9bRiKWdC81RvK8IeM8et4O0i1OOwqhhw=
X-Google-Smtp-Source: AGHT+IFO+HbHT17lxSo5vGP6w0EAuHQOZfH+cc4ak7hfS+RTZenB+gURXHXSuMhJ6iPZOXVQC0oVSXaElnzzGLtq18g=
X-Received: by 2002:a2e:9d96:0:b0:2bc:ce85:2de2 with SMTP id
 c22-20020a2e9d96000000b002bcce852de2mr15434052ljj.37.1693282406490; Mon, 28
 Aug 2023 21:13:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230829002316.28287-1-rdunlap@infradead.org>
In-Reply-To: <20230829002316.28287-1-rdunlap@infradead.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 29 Aug 2023 12:13:14 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4xxSeoF9Nu65jwMjV5dbywyue6rJvkW9yoVHVEjL93Fg@mail.gmail.com>
Message-ID: <CAAhV-H4xxSeoF9Nu65jwMjV5dbywyue6rJvkW9yoVHVEjL93Fg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Loongarch: KGDB: fix implicit declaration of flush_icache_range()
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Qing Zhang <zhangqing@loongson.cn>, 
	Hui Li <lihui@loongson.cn>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Randy,

On Tue, Aug 29, 2023 at 8:23=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Add <asm/cacheflush.h> to prevent a build error:
>
> arch/loongarch/kernel/kgdb.c: In function 'do_single_step':
> arch/loongarch/kernel/kgdb.c:440:9: error: implicit declaration of functi=
on 'flush_icache_range' [-Werror=3Dimplicit-function-declaration]
>   440 |         flush_icache_range(addr, addr + BREAK_INSTR_SIZE);
Thank you for your fixing, this will be included in linux-next.

Huacai
>
> Fixes: 8968eb010689 ("LoongArch: Add basic KGDB & KDB support")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Qing Zhang <zhangqing@loongson.cn>
> Cc: Hui Li <lihui@loongson.cn>
> Cc: Binbin Zhou <zhoubinbin@loongson.cn>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Cc: loongarch@lists.linux.dev
> ---
>  arch/loongarch/kernel/kgdb.c |    1 +
>  1 file changed, 1 insertion(+)
>
> diff -- a/arch/loongarch/kernel/kgdb.c b/arch/loongarch/kernel/kgdb.c
> --- a/arch/loongarch/kernel/kgdb.c
> +++ b/arch/loongarch/kernel/kgdb.c
> @@ -13,6 +13,7 @@
>  #include <linux/sched.h>
>  #include <linux/smp.h>
>
> +#include <asm/cacheflush.h>
>  #include <asm/fpu.h>
>  #include <asm/lbt.h>
>  #include <asm/hw_breakpoint.h>
