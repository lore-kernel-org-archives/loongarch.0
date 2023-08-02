Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B813E8BF3
	for <loongarch@lists.linux.dev>; Wed,  2 Aug 2023 15:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37963C433CD
	for <loongarch@lists.linux.dev>; Wed,  2 Aug 2023 15:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690989157;
	bh=Okcpc7Ru28gWwgJAhdc4dXD3GudgvC63PW18G2qLEFo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KTXzkScCftV8ORhHa3KqKf2yEP0SVRqfEaC4w59JKAZ3AWeshrbeUN8/aqhOo0i21
	 fqmyNbXiovVjQ6cYEW7v5inMqJYgQFEJnfbPLRGkQwYtPx6fo9B1BQd7uflj2S/TG7
	 050ua8EtWTfGJGGFjx/epnp9+nw0vEfmL4rZyGcDKqZockRzwUQL89KLbqagUFX4wm
	 wikNFLK6iNhCVPguIesC2A0kAykwIUuj7PRCU7o9C9xllyGbvnmqzBGM+V8ItveGAI
	 vGavUBSZ1+aWMZBagFxUdrNltjBTkYMgQbPDnviPu8KAUppBUT2aj75OHdqSRKQfaz
	 ThXvkPqll3aeQ==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-52222562f1eso10189077a12.3
        for <loongarch@lists.linux.dev>; Wed, 02 Aug 2023 08:12:37 -0700 (PDT)
X-Gm-Message-State: ABy/qLZ3AVZvD19EPC8O+Y2+Raj/PifsNxh9cb+PKVUENYAMan3t8DKi
	VGQmK0Ft9FbwN0x1SivY7dczC8EV8vLr5rcz+5E=
X-Google-Smtp-Source: APBJJlEp1/J3UDUUrL9ltHLTJwCY/UofAqmcg4h1pgHXJ1W0LOEh+9QJ7WsW+xZ6SWeNMPOxVYD1LP80S8qoovQExyY=
X-Received: by 2002:aa7:dcc3:0:b0:522:31d5:ee8e with SMTP id
 w3-20020aa7dcc3000000b0052231d5ee8emr5771244edu.8.1690989155487; Wed, 02 Aug
 2023 08:12:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230801025815.2436293-1-lienze@kylinos.cn>
In-Reply-To: <20230801025815.2436293-1-lienze@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 2 Aug 2023 23:12:23 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6FqreZtuOXYayhu=bLZeij+fxygbK5Mpw_kVuPTvdbWw@mail.gmail.com>
Message-ID: <CAAhV-H6FqreZtuOXYayhu=bLZeij+fxygbK5Mpw_kVuPTvdbWw@mail.gmail.com>
Subject: Re: [PATCH 0/4 v3] Add KFENCE support for LoongArch
To: Enze Li <lienze@kylinos.cn>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, glider@google.com, 
	elver@google.com, akpm@linux-foundation.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, zhangqing@loongson.cn, yangtiezhu@loongson.cn, 
	dvyukov@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Enze,

I applied this series (with some small modifications) together with KASAN a=
t:
https://github.com/chenhuacai/linux/commits/loongarch-next

Please confirm everything works well for you.

Huacai

On Tue, Aug 1, 2023 at 10:59=E2=80=AFAM Enze Li <lienze@kylinos.cn> wrote:
>
> Hi all,
>
> This patchset adds KFENCE support on LoongArch.
>
> To run the testcases, you will need to enable the following options,
>
> -> Kernel hacking
>    [*] Tracers
>        [*] Support for tracing block IO actions (NEW)
>    -> Kernel Testing and Coverage
>       <*> KUnit - Enable support for unit tests
>
> and then,
>
> -> Kernel hacking
>    -> Memory Debugging
>       [*] KFENCE: low-overhead sampling-based memory safety error detecto=
r (NEW)
>           <*> KFENCE integration test suite (NEW)
>
> With these options enabled, KFENCE will be tested during kernel startup.
> And normally, you might get the following feedback,
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> [   35.326363 ] # kfence: pass:23 fail:0 skip:2 total:25
> [   35.326486 ] # Totals: pass:23 fail:0 skip:2 total:25
> [   35.326621 ] ok 1 kfence
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>
> you might notice that 2 testcases have been skipped.  If you tend to run
> all testcases, please enable CONFIG_INIT_ON_FREE_DEFAULT_ON, you can
> find it here,
>
> -> Security options
>    -> Kernel hardening options
>       -> Memory initialization
>          [*] Enable heap memory zeroing on free by default
>
> and you might get all testcases passed.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> [   35.531860 ] # kfence: pass:25 fail:0 skip:0 total:25
> [   35.531999 ] # Totals: pass:25 fail:0 skip:0 total:25
> [   35.532135 ] ok 1 kfence
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>
> v3:
>    * Address Huacai's comments.
>    * Fix a bug that Jackie Liu pointed out.
>    * Rewrite arch_stack_walk() with the suggestion of Jinyang He.
>
> v2:
>    * Address Huacai's comments.
>    * Fix typos in commit message.
>
> Thanks,
> Enze
>
> Enze Li (4):
>   KFENCE: Defer the assignment of the local variable addr
>   LoongArch: mm: Add page table mapped mode support
>   LoongArch: Get stack without NMI when providing regs parameter
>   LoongArch: Add KFENCE support
>
>  arch/loongarch/Kconfig               |  1 +
>  arch/loongarch/include/asm/kfence.h  | 66 ++++++++++++++++++++++++++++
>  arch/loongarch/include/asm/page.h    |  8 +++-
>  arch/loongarch/include/asm/pgtable.h | 16 ++++++-
>  arch/loongarch/kernel/stacktrace.c   | 18 ++++----
>  arch/loongarch/mm/fault.c            | 22 ++++++----
>  arch/loongarch/mm/pgtable.c          |  7 +++
>  mm/kfence/core.c                     |  5 ++-
>  8 files changed, 123 insertions(+), 20 deletions(-)
>  create mode 100644 arch/loongarch/include/asm/kfence.h
>
> --
> 2.34.1
>
