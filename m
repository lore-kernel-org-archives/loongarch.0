Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B58B12B77
	for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 12:58:55 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so6675079e87.2
        for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 05:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686661134; x=1689253134;
        h=content-transfer-encoding:in-reply-to:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uoHY7f5SpaZmehHO5pzD7w8BkW1cE5mh1OnwQ8erXk0=;
        b=CUIbht58ZuwStSZVhwocni2OvSmzJRPWJ+NCYbrIO5E2jeIm8OWvSbKjWAUF4mF2C3
         VNJAaxxGxyupYMYb9iV1NEfgp8kqe4WhM4RejVZMxfLBZ1tPxLQg6gCHzt+C84PYL+qd
         Z0MG7yWOvTLmXe1bsPDNB3GdbpXk+HJPNtJzv+HWoPGlYmvkVOwpzNn9ocA7/3U59V/z
         rYF9zV3NWPCVIypyfAPy4+bLcVLWCHewWcbL16xaHRxR97CNzvhoV3UhJaCXeWMFsxcJ
         BFoS+SIEhH2xtYS/JiojnwG+A1u2+DDz5GKdR7hG1iBzr1Yveh8NbjGEbyeF2RbN3jxx
         LJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686661134; x=1689253134;
        h=content-transfer-encoding:in-reply-to:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uoHY7f5SpaZmehHO5pzD7w8BkW1cE5mh1OnwQ8erXk0=;
        b=Y20nvwWzzv32zpiV2b61rO1bFUiKLiefccYPp1NrUEnuUUKYRKilMO5gLTKPz15geK
         62PVmsS7nfJVjPQRRV/1kuBEC+L/g7aLoz93VV2UaXZP51FSeQ9kpzDSSgaHL4hID+Oj
         rkREx9FAZBVaeIDaw+dlayIL9+6xV3Yy+EUcQ+ajcj9X0sCs5SbmabIileLe8PjgwcKh
         sedD9CMaEtH9fLWMIrupQzJb7LhAihB3e9TDfclF4oY168sJDrQJj1i1A/TWIaSG2N/r
         MrXAcxb37ToMDwon6K6N7DJbW2SwA+cPjK0OKRpBHR3pw0Torb5eNe71k8yfFv2GZf7b
         FAHg==
X-Gm-Message-State: AC+VfDy2Q2KbwEGN5sYvHtDbgTLiDLFkl8HTcCxrPNF0T8WY/wBy85PK
	X0NysWOuzRX0hQwLtBa1ux4=
X-Google-Smtp-Source: ACHHUZ5hpxIirshOoeLkuF5RellTk57gwjytTxxsOJZKHLvqweumaYxLmUUZFl2Bj2FETplTZqT4/g==
X-Received: by 2002:a19:3807:0:b0:4ef:f11c:f5b0 with SMTP id f7-20020a193807000000b004eff11cf5b0mr5800493lfa.54.1686661133869;
        Tue, 13 Jun 2023 05:58:53 -0700 (PDT)
Received: from ?IPV6:2a0b:6204:4302:5f00:4dab:3483:4506:9a0e? ([2a0b:6204:4302:5f00:4dab:3483:4506:9a0e])
        by smtp.gmail.com with ESMTPSA id a8-20020a19f808000000b004f14ecc03f1sm1769903lff.100.2023.06.13.05.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 05:58:53 -0700 (PDT)
From: "bibo, mao" <bibo.mao@gmail.com>
X-Google-Original-From: "bibo, mao" <maobibo@loongson.cn>
Message-ID: <e6508c4c-4987-37ed-9c4e-9189417e0f83@loongson.cn>
Date: Tue, 13 Jun 2023 20:58:49 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v13 20/30] LoongArch: KVM: Implement handle csr excption
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Oliver Upton <oliver.upton@linux.dev>, Xi Ruoyao <xry111@xry111.site>,
 tangyouling@loongson.cn, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
References: <20230609090832.2131037-1-zhaotianrui@loongson.cn>
 <20230609090832.2131037-21-zhaotianrui@loongson.cn>
In-Reply-To: <20230609090832.2131037-21-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Reviewed-by: Bibo Mao <maobibo@loongson.cn>

Regards
Bibo, Mao

在 2023/6/9 17:08, Tianrui Zhao 写道:
> Implement kvm handle LoongArch vcpu exit caused by reading and
> writing csr. Using csr structure to emulate the registers.
> 
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>   arch/loongarch/kvm/exit.c | 98 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 98 insertions(+)
>   create mode 100644 arch/loongarch/kvm/exit.c
> 
> diff --git a/arch/loongarch/kvm/exit.c b/arch/loongarch/kvm/exit.c
> new file mode 100644
> index 000000000000..18635333fc9a
> --- /dev/null
> +++ b/arch/loongarch/kvm/exit.c
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020-2023 Loongson Technology Corporation Limited
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/preempt.h>
> +#include <linux/vmalloc.h>
> +#include <asm/fpu.h>
> +#include <asm/inst.h>
> +#include <asm/time.h>
> +#include <asm/tlb.h>
> +#include <asm/loongarch.h>
> +#include <asm/numa.h>
> +#include <asm/kvm_vcpu.h>
> +#include <asm/kvm_csr.h>
> +#include <linux/kvm_host.h>
> +#include <asm/mmzone.h>
> +#include "trace.h"
> +
> +static unsigned long _kvm_emu_read_csr(struct kvm_vcpu *vcpu, int csrid)
> +{
> +	struct loongarch_csrs *csr = vcpu->arch.csr;
> +	unsigned long val = 0;
> +
> +	if (get_gcsr_flag(csrid) & SW_GCSR)
> +		val = kvm_read_sw_gcsr(csr, csrid);
> +	else
> +		pr_warn_once("Unsupport csrread 0x%x with pc %lx\n",
> +			csrid, vcpu->arch.pc);
> +	return val;
> +}
> +
> +static void _kvm_emu_write_csr(struct kvm_vcpu *vcpu, int csrid,
> +	unsigned long val)
> +{
> +	struct loongarch_csrs *csr = vcpu->arch.csr;
> +
> +	if (get_gcsr_flag(csrid) & SW_GCSR)
> +		kvm_write_sw_gcsr(csr, csrid, val);
> +	else
> +		pr_warn_once("Unsupport csrwrite 0x%x with pc %lx\n",
> +				csrid, vcpu->arch.pc);
> +}
> +
> +static void _kvm_emu_xchg_csr(struct kvm_vcpu *vcpu, int csrid,
> +	unsigned long csr_mask, unsigned long val)
> +{
> +	struct loongarch_csrs *csr = vcpu->arch.csr;
> +
> +	if (get_gcsr_flag(csrid) & SW_GCSR) {
> +		unsigned long orig;
> +
> +		orig = kvm_read_sw_gcsr(csr, csrid);
> +		orig &= ~csr_mask;
> +		orig |= val & csr_mask;
> +		kvm_write_sw_gcsr(csr, csrid, orig);
> +	} else
> +		pr_warn_once("Unsupport csrxchg 0x%x with pc %lx\n",
> +				csrid, vcpu->arch.pc);
> +}
> +
> +static int _kvm_handle_csr(struct kvm_vcpu *vcpu, larch_inst inst)
> +{
> +	unsigned int rd, rj, csrid;
> +	unsigned long csr_mask;
> +	unsigned long val = 0;
> +
> +	/*
> +	 * CSR value mask imm
> +	 * rj = 0 means csrrd
> +	 * rj = 1 means csrwr
> +	 * rj != 0,1 means csrxchg
> +	 */
> +	rd = inst.reg2csr_format.rd;
> +	rj = inst.reg2csr_format.rj;
> +	csrid = inst.reg2csr_format.csr;
> +
> +	/* Process CSR ops */
> +	if (rj == 0) {
> +		/* process csrrd */
> +		val = _kvm_emu_read_csr(vcpu, csrid);
> +		vcpu->arch.gprs[rd] = val;
> +	} else if (rj == 1) {
> +		/* process csrwr */
> +		val = vcpu->arch.gprs[rd];
> +		_kvm_emu_write_csr(vcpu, csrid, val);
> +	} else {
> +		/* process csrxchg */
> +		val = vcpu->arch.gprs[rd];
> +		csr_mask = vcpu->arch.gprs[rj];
> +		_kvm_emu_xchg_csr(vcpu, csrid, csr_mask, val);
> +	}
> +
> +	return EMULATE_DONE;
> +}
