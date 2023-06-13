Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA02B134B4
	for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 12:55:38 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4f74d6695e4so1800446e87.1
        for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 05:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686660936; x=1689252936;
        h=content-transfer-encoding:in-reply-to:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7W4Ko7B93IyT3dfDQ20KvPSlqIiHOiBygYp9QycGPqs=;
        b=nRlCBrjUCbQYb/IV7ca5ZWxF4mIazYwhIIOhnxiMieuweYM8m1KLxoDqTKPsenscqE
         NXw8H6iao41gaI8Lg/5p4XKred2dJPaVOKj3hhIQDaUgeuoVKR7LWglPLX0FPaKDPth6
         mDInWTkkApDulCDMZBlMho4gsnXecb+PDMC57fPausljNELnJsszsBzbtWuZaT6J/QUr
         avx7QWXKEGae1rHK7rs06lok9x7Qgx7fnHHrRV+rBFIWGYhF1ul9P5qVbdJ/9G0wT4bm
         tn8IhXeVqbTTACz8vC2iCmp/uqPWqtqJw+mgSY0pn4hSnoJN0zz2n/mXm/BZFzN2jfhY
         0lNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686660936; x=1689252936;
        h=content-transfer-encoding:in-reply-to:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7W4Ko7B93IyT3dfDQ20KvPSlqIiHOiBygYp9QycGPqs=;
        b=L6d+8dTMCH8B6jrD0H/WKyqlHwtRu8Yz0pb8EMrrwscCSJg487mGuHcNq5/xXRUF1o
         l6l2zfcD41e9/cwYFP0ELyQJOYTBYe3KkWB0nifStcWiqCuU9JuGFuu+/1yCG3XHIQUS
         bci95TKyhsyjJWzqNg6hGlwaJrN2EdDKO4hGTJ9JUexqRIIXPE/DTlHfG+KhPEKZoPCs
         3AXylbCsXQiYUnk24ssMM7OMWT0FWhvpSn9lK729Qg83y44btKcxY2jayHU4TFX5xy/P
         l6rVpMtli/Xe0EuCYKbF5wqILNpJpzkQxmWNAB06fMAZ8Oy6LJMYUFOISm4f4ebM2upd
         zWgA==
X-Gm-Message-State: AC+VfDzxZPyNUibyygPJpaY084vnbUZ2PoDrs2UC7KjgQj6BVFVm2jB5
	TnhF2yM0H4N0odPRsw9q7C0=
X-Google-Smtp-Source: ACHHUZ5aEihzgwDHTfPgw2C4xeRI9zWQt88zi7pcD1IPMvrLDYIuZFevQCvhsGhyvFAtw3uIfC+Bjw==
X-Received: by 2002:a19:e057:0:b0:4f4:d60a:e387 with SMTP id g23-20020a19e057000000b004f4d60ae387mr4045663lfj.1.1686660936507;
        Tue, 13 Jun 2023 05:55:36 -0700 (PDT)
Received: from ?IPV6:2a0b:6204:4302:5f00:4dab:3483:4506:9a0e? ([2a0b:6204:4302:5f00:4dab:3483:4506:9a0e])
        by smtp.gmail.com with ESMTPSA id g12-20020a19ee0c000000b004eff6c7bc08sm1759382lfb.75.2023.06.13.05.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 05:55:36 -0700 (PDT)
From: "bibo, mao" <bibo.mao@gmail.com>
X-Google-Original-From: "bibo, mao" <maobibo@loongson.cn>
Message-ID: <a4b3a4cc-b424-d1cf-5583-16de24d58873@loongson.cn>
Date: Tue, 13 Jun 2023 20:55:32 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v13 07/30] LoongArch: KVM: Implement vcpu run interface
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Oliver Upton <oliver.upton@linux.dev>, Xi Ruoyao <xry111@xry111.site>,
 tangyouling@loongson.cn, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
References: <20230609090832.2131037-1-zhaotianrui@loongson.cn>
 <20230609090832.2131037-8-zhaotianrui@loongson.cn>
In-Reply-To: <20230609090832.2131037-8-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Reviewed-by: Bibo Mao <maobibo@loongson.cn>


Regards
Bibo, Mao

在 2023/6/9 17:08, Tianrui Zhao 写道:
> Implement vcpu run interface, handling mmio, iocsr reading fault
> and deliver interrupt, lose fpu before vcpu enter guest.
> 
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>   arch/loongarch/kvm/vcpu.c | 83 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 83 insertions(+)
> 
> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
> index 24b5b00266a1..eba5c07b8be3 100644
> --- a/arch/loongarch/kvm/vcpu.c
> +++ b/arch/loongarch/kvm/vcpu.c
> @@ -17,6 +17,41 @@ int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
>   	return 0;
>   }
>   
> +/* Returns 1 if the guest TLB may be clobbered */
> +static int _kvm_check_requests(struct kvm_vcpu *vcpu)
> +{
> +	int ret = 0;
> +
> +	if (!kvm_request_pending(vcpu))
> +		return 0;
> +
> +	if (kvm_check_request(KVM_REQ_TLB_FLUSH, vcpu)) {
> +		/* Drop vpid for this vCPU */
> +		vcpu->arch.vpid = 0;
> +		/* This will clobber guest TLB contents too */
> +		ret = 1;
> +	}
> +
> +	return ret;
> +}
> +
> +static void kvm_pre_enter_guest(struct kvm_vcpu *vcpu)
> +{
> +	/*
> +	 * handle vcpu timer, interrupts, check requests and
> +	 * check vmid before vcpu enter guest
> +	 */
> +	kvm_acquire_timer(vcpu);
> +	_kvm_deliver_intr(vcpu);
> +	/* make sure the vcpu mode has been written */
> +	smp_store_mb(vcpu->mode, IN_GUEST_MODE);
> +	_kvm_check_requests(vcpu);
> +	_kvm_check_vmid(vcpu);
> +	vcpu->arch.host_eentry = csr_read64(LOONGARCH_CSR_EENTRY);
> +	/* clear KVM_LARCH_CSR as csr will change when enter guest */
> +	vcpu->arch.aux_inuse &= ~KVM_LARCH_CSR;
> +}
> +
>   int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>   {
>   	unsigned long timer_hz;
> @@ -86,3 +121,51 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
>   			context->last_vcpu = NULL;
>   	}
>   }
> +
> +int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
> +{
> +	int r = -EINTR;
> +	struct kvm_run *run = vcpu->run;
> +
> +	vcpu_load(vcpu);
> +
> +	kvm_sigset_activate(vcpu);
> +
> +	if (vcpu->mmio_needed) {
> +		if (!vcpu->mmio_is_write)
> +			_kvm_complete_mmio_read(vcpu, run);
> +		vcpu->mmio_needed = 0;
> +	}
> +
> +	if (run->exit_reason == KVM_EXIT_LOONGARCH_IOCSR) {
> +		if (!run->iocsr_io.is_write)
> +			_kvm_complete_iocsr_read(vcpu, run);
> +	}
> +
> +	/* clear exit_reason */
> +	run->exit_reason = KVM_EXIT_UNKNOWN;
> +	if (run->immediate_exit)
> +		goto out;
> +
> +	lose_fpu(1);
> +
> +	local_irq_disable();
> +	guest_timing_enter_irqoff();
> +
> +	kvm_pre_enter_guest(vcpu);
> +	trace_kvm_enter(vcpu);
> +
> +	guest_state_enter_irqoff();
> +	r = kvm_loongarch_ops->enter_guest(run, vcpu);
> +
> +	/* guest_state_exit_irqoff() already done.  */
> +	trace_kvm_out(vcpu);
> +	guest_timing_exit_irqoff();
> +	local_irq_enable();
> +
> +out:
> +	kvm_sigset_deactivate(vcpu);
> +
> +	vcpu_put(vcpu);
> +	return r;
> +}
