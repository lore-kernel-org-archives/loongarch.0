Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C3D15A8
	for <loongarch@lists.linux.dev>; Wed, 19 Apr 2023 02:02:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1CCBC433AC
	for <loongarch@lists.linux.dev>; Wed, 19 Apr 2023 02:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681869741;
	bh=lm0q5w4aW9UWr5JFvmc6VHFT17ZREurre436iTeCi1U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Qmd/xeWCMmjfr5V0h3IPBWzprvdmr1dJKpf26mvmJZJLOggXCCOqQz9mqHndc6FaQ
	 tFZkaFQhTztnafLms20hmTl1owNqne78IBPhRRds6YL5o1yXYTDCAHsRbpyp8HQxIo
	 0NLmsOEWmUyI04pcrX1U8dzmSg636dmEYuge5E21QAjesnU7sTSW6Ema7HBmstC9Tq
	 pI6cc+z1S1PPFKRAPLFBFLV2kk8ItPG2tLtcJ661io2OmQ/mveurMYKUntvNEqjVBF
	 jRWH7HlLGiBMbWIE7Hkl9MxteCknegmuhJQne4PB1C8DQfJAHeZict91Z/vmqDzE+Z
	 ipncC8sQCXjBA==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-94f0dd117dcso232830166b.3
        for <loongarch@lists.linux.dev>; Tue, 18 Apr 2023 19:02:21 -0700 (PDT)
X-Gm-Message-State: AAQBX9dpY1i6n05ShBeJEC1j+n1QeAgzhN2DHoGkoTHLoAUU4C0via0U
	1BIkivKY6cKxT9l8H4RA4ftb/ToL4Cj2/TOCeWk=
X-Google-Smtp-Source: AKy350aRqTfkeesWC9AipgdSL1WMNHVKUJqczcqB8io+zaeMyMTo8TU+l8PEtKBwW9kYd4ZBhxN/WfRk+KOkCXxblpU=
X-Received: by 2002:a50:999d:0:b0:506:6f14:47d8 with SMTP id
 m29-20020a50999d000000b005066f1447d8mr421936edb.1.1681869740123; Tue, 18 Apr
 2023 19:02:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230417094649.874671-1-zhaotianrui@loongson.cn> <20230417094649.874671-18-zhaotianrui@loongson.cn>
In-Reply-To: <20230417094649.874671-18-zhaotianrui@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 19 Apr 2023 10:02:07 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4Ca18bo-DV8gzaJeVCDT8o_dqFfX4+ruQLHL+V+HrmOg@mail.gmail.com>
Message-ID: <CAAhV-H4Ca18bo-DV8gzaJeVCDT8o_dqFfX4+ruQLHL+V+HrmOg@mail.gmail.com>
Subject: Re: [PATCH v7 17/30] LoongArch: KVM: Implement virtual machine tlb operations
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Paolo Bonzini <pbonzini@redhat.com>, WANG Xuerui <kernel@xen0n.name>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>, 
	Alex Deucher <alexander.deucher@amd.com>, Oliver Upton <oliver.upton@linux.dev>, maobibo@loongson.cn, 
	Xi Ruoyao <xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tianrui,

On Mon, Apr 17, 2023 at 5:47=E2=80=AFPM Tianrui Zhao <zhaotianrui@loongson.=
cn> wrote:
>
> Implement loongarch virtual machine tlb operations such as flush tlb by
> specific gpa parameter and flush all of the virt machines tlb.
Use LoongArch instead of loongarch in commit messages and comments, please.

Huacai
>
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>  arch/loongarch/kvm/tlb.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 arch/loongarch/kvm/tlb.c
>
> diff --git a/arch/loongarch/kvm/tlb.c b/arch/loongarch/kvm/tlb.c
> new file mode 100644
> index 000000000000..66e116cf2486
> --- /dev/null
> +++ b/arch/loongarch/kvm/tlb.c
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020-2023 Loongson Technology Corporation Limited
> + */
> +
> +#include <linux/kvm_host.h>
> +#include <asm/tlb.h>
> +
> +int kvm_flush_tlb_gpa(struct kvm_vcpu *vcpu, unsigned long gpa)
> +{
> +       preempt_disable();
> +       gpa &=3D (PAGE_MASK << 1);
> +       invtlb(INVTLB_GID_ADDR, read_csr_gstat() & CSR_GSTAT_GID, gpa);
> +       preempt_enable();
> +       return 0;
> +}
> +
> +/**
> + * kvm_flush_tlb_all() - Flush all root TLB entries for
> + * guests.
> + *
> + * Invalidate all entries including GVA-->GPA and GPA-->HPA mappings.
> + */
> +void kvm_flush_tlb_all(void)
> +{
> +       unsigned long flags;
> +
> +       local_irq_save(flags);
> +       invtlb_all(INVTLB_ALLGID, 0, 0);
> +       local_irq_restore(flags);
> +}
> --
> 2.31.1
>
