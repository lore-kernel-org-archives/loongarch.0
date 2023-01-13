Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DCC364
	for <loongarch@lists.linux.dev>; Fri, 13 Jan 2023 06:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3D9C43392
	for <loongarch@lists.linux.dev>; Fri, 13 Jan 2023 06:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673592278;
	bh=2azx1ixtcOM7V1y+vOPKuldBI1b01fqShEWlRDQ+xnA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jTDt0Kdcnk3Aif1TSyqOp06Z3YBBicYBNBGZwu11VaPlsVIaPcygtlwT/8SS0sE1Y
	 x8rshkUI0uTRhtqzLlHehKkCBCzdC/NzduC2+NJRg1ksoBBV4rU6YFzptjp++MKz1h
	 Fj7ikf4KYnbKWaiuB5O1V11+DC9y1cGkK3FJZmByeZ4noyuysbvaLkj8Fs9BtJ6ojp
	 cp3ViGDXP6uojnEdgfr8SdJuMmy5aWfp7+OUct8wERd/r2RwTzo3jNanXMYbmodnz6
	 XpQrXtmaVIaxOwvHcIYLiGVzGO1Rur1g3b0lRUbHCF5qLFj697x5tGzP3dattS7Euo
	 LgPDtZYRWFaxg==
Received: by mail-ej1-f53.google.com with SMTP id u9so50136807ejo.0
        for <loongarch@lists.linux.dev>; Thu, 12 Jan 2023 22:44:38 -0800 (PST)
X-Gm-Message-State: AFqh2kqLycLvf6tOcg3CDSlNihWLwnNRzp41rFAMgpfTeM4Xz+HkMGwL
	3yNxEzfCtAqmsdchikNVCSgabjrb1ayIvupEYmM=
X-Google-Smtp-Source: AMrXdXsf1V4FW9Dk8AGMYqKkg/deVboK+gjlFShKhfSdgkuy9cDgQYNu7iXG6q5vEmnpqU/ybmXsJvDy1bt2s8fQfAQ=
X-Received: by 2002:a17:906:168d:b0:7c0:ff76:7866 with SMTP id
 s13-20020a170906168d00b007c0ff767866mr4895290ejd.272.1673592277047; Thu, 12
 Jan 2023 22:44:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1673255274-18238-1-git-send-email-tangyouling@loongson.cn>
In-Reply-To: <1673255274-18238-1-git-send-email-tangyouling@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 13 Jan 2023 14:44:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6+uf5012Qk1_pYi5duD6ZT7qFcZXj-RzdnvUorv2FxhA@mail.gmail.com>
Message-ID: <CAAhV-H6+uf5012Qk1_pYi5duD6ZT7qFcZXj-RzdnvUorv2FxhA@mail.gmail.com>
Subject: Re: [PATCH 0/4] LoongArch: Add kernel relocation and KASLR support
To: Youling Tang <tangyouling@loongson.cn>
Cc: Xi Ruoyao <xry111@xry111.site>, Jinyang He <hejinyang@loongson.cn>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi, Ruoyao and Jinyang,

Could you please take some time to review this patchset?

Huacai

On Mon, Jan 9, 2023 at 5:08 PM Youling Tang <tangyouling@loongson.cn> wrote:
>
> This patch series to support kernel relocation and KASLR (only 64bit).
>
> Both old[1] and new[2] toolchains support this feature, and the test results
> are as follows:
> 1) Enable CONFING_RELOCATABLE
>  # cat /proc/iomem
>  00000000-0fffffff : System RAM
>    00000000-002c3fff : Reserved
>    002c4000-008c3fff : Reserved
>    02000000-02f4ffff : Kernel code
>    02f50000-0381cbff : Kernel data
>    0381cc00-0394ae37 : Kernel bss
>
> 2) Enable CONFING_RANDOMIZE_BASE (KASLR)
> first:
>  # cat /proc/iomem
>  00000000-0fffffff : System RAM
>    00000000-002c3fff : Reserved
>    002c4000-008c3fff : Reserved
>    02550000-0349ffff : Kernel code
>    034a0000-03d6cbff : Kernel data
>    03d6cc00-03e9ae37 : Kernel bss
>
> second:
>  # cat /proc/iomem
>  00000000-0fffffff : System RAM
>    00000000-002c3fff : Reserved
>    002c4000-008c3fff : Reserved
>    02ad0000-03a1ffff : Kernel code
>    03a20000-042ecbff : Kernel data
>    042ecc00-0441ae37 : Kernel bss
>
> Thanks to @Ruoyao's and @Jinyang's for their help and suggestions.
>
> Links:
> [1]: https://github.com/sunhaiyong1978/CLFS-for-LoongArch/releases/download/5.0/loongarch64-clfs-5.1-cross-tools-c-only.tar.xz
> [2]: https://github.com/sunhaiyong1978/CLFS-for-LoongArch/releases/download/6.0/loongarch64-clfs-6.3-cross-tools-c-only.tar.xz
>
> Xi Ruoyao (1):
>   LoongArch: Use trampoline for exception handlers and kill la.abs
>
> Youling Tang (3):
>   LoongArch: Add JUMP_LINK_ADDR macro implementation to avoid using
>     la.abs
>   LoongArch: Add support for kernel relocation
>   LoongArch: Add support for kernel address space layout randomization
>     (KASLR)
>
>  arch/loongarch/Kconfig                  |  37 +++++
>  arch/loongarch/Makefile                 |   5 +
>  arch/loongarch/include/asm/page.h       |   6 +
>  arch/loongarch/include/asm/stackframe.h |  16 +-
>  arch/loongarch/include/asm/uaccess.h    |   1 -
>  arch/loongarch/kernel/Makefile          |   2 +
>  arch/loongarch/kernel/entry.S           |   6 +-
>  arch/loongarch/kernel/genex.S           |  20 +--
>  arch/loongarch/kernel/head.S            |  30 +++-
>  arch/loongarch/kernel/relocate.c        | 210 ++++++++++++++++++++++++
>  arch/loongarch/kernel/setup.c           |   3 +
>  arch/loongarch/kernel/traps.c           |   4 +-
>  arch/loongarch/kernel/vmlinux.lds.S     |  11 +-
>  arch/loongarch/mm/tlbex.S               |  28 +---
>  arch/loongarch/power/suspend_asm.S      |   5 +-
>  15 files changed, 333 insertions(+), 51 deletions(-)
>  create mode 100644 arch/loongarch/kernel/relocate.c
>
> --
> 2.37.1
>
