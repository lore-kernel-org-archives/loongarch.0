Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D7215A8
	for <loongarch@lists.linux.dev>; Wed, 19 Apr 2023 02:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D178DC433EF
	for <loongarch@lists.linux.dev>; Wed, 19 Apr 2023 02:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681869679;
	bh=iBlh28TwhAfAOpQn0iW0qTVueiUBFG1Clgv9DyctZHo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nBLK5fqU1LDEehg+DUn+8wqvQeFgzRhdmsKIebUyJNu2Sm2FMG9N+etejYXsbDcS2
	 riyZzENUZWM1kT682uapI0Oo8u9oAPCb/YUhfzb71BBg9pBzHvcQ+ndxjgPdRsExaq
	 4z604ACa5OQbe8pDpo7QSEqOPm8hWEgMKRWSi2u4AsvHSGyOd3oDmF6bdHQJNhsn4B
	 qxfv5gcREwaJusAy4B/V4qsXAx1Lpw0bLnJXILBvHpMSHqazkYUCKfVJjjDaSQHdz4
	 uV9dmdRuzSUPzOouiBp1/Jh7+AfD0LIyK0/lEoA7go+QRdZWcKZDdieBaRgpuV1axK
	 A1z3+nKPY560g==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-94ef8b88a5bso256754166b.2
        for <loongarch@lists.linux.dev>; Tue, 18 Apr 2023 19:01:19 -0700 (PDT)
X-Gm-Message-State: AAQBX9d3cQrVmA4mVCoUMFssqNZ8sF9IyLnSBhHSHvuT6/tmcv5Ppuoy
	JoRFWVIh1DzPLXDTYIOK42J+K4iKcsF0Kfj4DiI=
X-Google-Smtp-Source: AKy350YzCPsEuU/QgPldRByN8AxiTqkiTIMjJ1d08L4FjwW/8MzcbGwJ+sIMbOKRGKHaryaFuxSIJF5py0mx76OJbmA=
X-Received: by 2002:a50:d482:0:b0:505:47d:29b5 with SMTP id
 s2-20020a50d482000000b00505047d29b5mr2088158edi.1.1681869678082; Tue, 18 Apr
 2023 19:01:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230417094649.874671-1-zhaotianrui@loongson.cn> <20230417094649.874671-17-zhaotianrui@loongson.cn>
In-Reply-To: <20230417094649.874671-17-zhaotianrui@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 19 Apr 2023 10:01:05 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4pyBi=0ckNDLErz6G_b5G7ti2wVDXF3a7xv-MiJtF_tA@mail.gmail.com>
Message-ID: <CAAhV-H4pyBi=0ckNDLErz6G_b5G7ti2wVDXF3a7xv-MiJtF_tA@mail.gmail.com>
Subject: Re: [PATCH v7 16/30] LoongArch: KVM: Implement update VM id function
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
> Implement kvm check vmid and update vmid, the vmid should be checked befo=
re
> vcpu enter guest.
>
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>  arch/loongarch/kvm/vmid.c | 65 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 arch/loongarch/kvm/vmid.c
>
> diff --git a/arch/loongarch/kvm/vmid.c b/arch/loongarch/kvm/vmid.c
> new file mode 100644
> index 000000000000..7d9688c24184
> --- /dev/null
> +++ b/arch/loongarch/kvm/vmid.c
> @@ -0,0 +1,65 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020-2023 Loongson Technology Corporation Limited
> + */
> +
> +#include <linux/kvm_host.h>
> +#include <asm/kvm_host.h>
linux/kvm_host.h already include asm/kvm_host.h

Huacai
> +#include "trace.h"
> +
> +static void _kvm_update_vpid(struct kvm_vcpu *vcpu, int cpu)
> +{
> +       struct kvm_context *context;
> +       unsigned long vpid;
> +
> +       context =3D per_cpu_ptr(vcpu->kvm->arch.vmcs, cpu);
> +       vpid =3D context->vpid_cache + 1;
> +       if (!(vpid & vpid_mask)) {
> +               /* finish round of 64 bit loop */
> +               if (unlikely(!vpid))
> +                       vpid =3D vpid_mask + 1;
> +
> +               /* vpid 0 reserved for root */
> +               ++vpid;
> +
> +               /* start new vpid cycle */
> +               kvm_flush_tlb_all();
> +       }
> +
> +       context->vpid_cache =3D vpid;
> +       vcpu->arch.vpid =3D vpid;
> +}
> +
> +void _kvm_check_vmid(struct kvm_vcpu *vcpu, int cpu)
> +{
> +       struct kvm_context *context;
> +       bool migrated;
> +       unsigned long ver, old, vpid;
> +
> +       /*
> +        * Are we entering guest context on a different CPU to last time?
> +        * If so, the VCPU's guest TLB state on this CPU may be stale.
> +        */
> +       context =3D per_cpu_ptr(vcpu->kvm->arch.vmcs, cpu);
> +       migrated =3D (vcpu->arch.last_exec_cpu !=3D cpu);
> +       vcpu->arch.last_exec_cpu =3D cpu;
> +
> +       /*
> +        * Check if our vpid is of an older version
> +        *
> +        * We also discard the stored vpid if we've executed on
> +        * another CPU, as the guest mappings may have changed without
> +        * hypervisor knowledge.
> +        */
> +       ver =3D vcpu->arch.vpid & ~vpid_mask;
> +       old =3D context->vpid_cache  & ~vpid_mask;
> +       if (migrated || (ver !=3D old)) {
> +               _kvm_update_vpid(vcpu, cpu);
> +               trace_kvm_vpid_change(vcpu, vcpu->arch.vpid);
> +       }
> +
> +       /* Restore GSTAT(0x50).vpid */
> +       vpid =3D (vcpu->arch.vpid & vpid_mask)
> +               << CSR_GSTAT_GID_SHIFT;
> +       change_csr_gstat(vpid_mask << CSR_GSTAT_GID_SHIFT, vpid);
> +}
> --
> 2.31.1
>
