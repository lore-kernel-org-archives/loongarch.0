Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79841522B
	for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 12:49:34 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so6659654e87.2
        for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 05:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686660572; x=1689252572;
        h=content-transfer-encoding:in-reply-to:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gmQyg9/IsE7vybupq2HnNpp0eUH7WhJlrGp6WZrhAn4=;
        b=RK0JGICH7XDUQYLyZTqr1U+i6igdBy59gSYCFMK1wi+qd+nTKwNZvY86ex3S+0N10P
         cygR1SyPTXJ1wfpNFx+60Ct6eVQE22yZZMLAP9XYLK/GihboAn8+QAVvdfSIcFONV3HV
         if3JDH5yhFkbu3Q0pgC45UnK5VZd6Y7e9DROAR2izbAmYjfxebmc/L9Xx+DydzzHrOG8
         o219AN/c6bZMo2yjMTmBRlApJ7oh2VWaNzd3WCeUKMMqdEb2aiLce80RjjDqBa1Zvukb
         /cQ7wLN6lPiZuEgbywGQs6LpVReNdKoAs2kKDW3MstiVcIchaPllmM9ceYSxJUX8gRrU
         oFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686660572; x=1689252572;
        h=content-transfer-encoding:in-reply-to:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gmQyg9/IsE7vybupq2HnNpp0eUH7WhJlrGp6WZrhAn4=;
        b=ZNeXsAmUbfDwC+8IAlESTRKx5zXJJU+ZTa8vgoIeuCX6PpdWUThYE8wkTpvIWU4Pwc
         /m5O+RZ6TyWfCb6Fo/XZIQVLeFWeTXmA+hcDiSBamvCI52MqESlwDuWW+IMCNVUX39+l
         WezDBEGEY+AQahze/ofClBa4g31x343LTUxR5URBC4azWPfDIAq5SnQHJNlwAAIfbqZ9
         pVgbfcePXdgDhPwAG808Q08axsYAX3g21rrBOSR6nk/JdOfOEy5A2okn0juwsjNIvcCo
         WtjEwSbArw5smrhCZoJoow6B3dKAO4Fz90nWZiZirp9abe4+B/pqNU3CuzBg2K/zD22r
         6lyA==
X-Gm-Message-State: AC+VfDz3+sMOs+2a/9SsqCwzEHayoyc/ydRoBwAsU4zmvbHV/+6nJO+Z
	Gl2iupfvJa7r0PLMxIIEitwrvjMksH3yc3I4Za0=
X-Google-Smtp-Source: ACHHUZ6JVds8bYIfYxk9bO9+uKSvGoQYAWa94DZcakOPfDG9fl6KyQrXctBWLCC46hPWBEW2lXAk3g==
X-Received: by 2002:a19:e30e:0:b0:4f0:1124:8b2a with SMTP id a14-20020a19e30e000000b004f011248b2amr5147703lfh.46.1686660572162;
        Tue, 13 Jun 2023 05:49:32 -0700 (PDT)
Received: from ?IPV6:2a0b:6204:4302:5f00:4dab:3483:4506:9a0e? ([2a0b:6204:4302:5f00:4dab:3483:4506:9a0e])
        by smtp.gmail.com with ESMTPSA id c20-20020a197614000000b004f24bc0cbf9sm1754680lff.154.2023.06.13.05.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 05:49:31 -0700 (PDT)
From: "bibo, mao" <bibo.mao@gmail.com>
X-Google-Original-From: "bibo, mao" <maobibo@loongson.cn>
Message-ID: <cc73aaf7-85bf-2062-6d1b-f1cbb70242f8@loongson.cn>
Date: Tue, 13 Jun 2023 20:49:26 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v13 03/30] LoongArch: KVM: Implement kvm hardware enable,
 disable interface
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Oliver Upton <oliver.upton@linux.dev>, Xi Ruoyao <xry111@xry111.site>,
 tangyouling@loongson.cn, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
References: <20230609090832.2131037-1-zhaotianrui@loongson.cn>
 <20230609090832.2131037-4-zhaotianrui@loongson.cn>
In-Reply-To: <20230609090832.2131037-4-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2023/6/9 17:08, Tianrui Zhao 写道:
> Implement kvm hardware enable, disable interface, setting
> the guest config register to enable virtualization features
> when called the interface.
> 
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>   arch/loongarch/kvm/main.c | 64 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 64 insertions(+)
> 
> diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
> index f98c1619725f..5ebae1ea7565 100644
> --- a/arch/loongarch/kvm/main.c
> +++ b/arch/loongarch/kvm/main.c
> @@ -195,6 +195,70 @@ static void _kvm_init_gcsr_flag(void)
>   	set_gcsr_sw_flag(LOONGARCH_CSR_PERFCNTR3);
>   }
>   
> +void kvm_init_vmcs(struct kvm *kvm)
> +{
> +	kvm->arch.vmcs = vmcs;
> +}
> +
> +long kvm_arch_dev_ioctl(struct file *filp,
> +			unsigned int ioctl, unsigned long arg)
> +{
> +	return -ENOIOCTLCMD;
> +}
> +
> +#ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
Can we remove macro CONFIG_KVM_GENERIC_HARDWARE_ENABLING here since it 
is always enabled? The other looks good to me.

Reviewed-by: Bibo Mao <maobibo@loongson.cn>

Regards
Bibo, Mao
> +int kvm_arch_hardware_enable(void)
> +{
> +	unsigned long env, gcfg = 0;
> +
> +	env = read_csr_gcfg();
> +	/* First init gtlbc, gcfg, gstat, gintc. All guest use the same config */
> +	clear_csr_gtlbc(CSR_GTLBC_USETGID | CSR_GTLBC_TOTI);
> +	write_csr_gcfg(0);
> +	write_csr_gstat(0);
> +	write_csr_gintc(0);
> +
> +	/*
> +	 * Enable virtualization features granting guest direct control of
> +	 * certain features:
> +	 * GCI=2:       Trap on init or unimplement cache instruction.
> +	 * TORU=0:      Trap on Root Unimplement.
> +	 * CACTRL=1:    Root control cache.
> +	 * TOP=0:       Trap on Previlege.
> +	 * TOE=0:       Trap on Exception.
> +	 * TIT=0:       Trap on Timer.
> +	 */
> +	if (env & CSR_GCFG_GCIP_ALL)
> +		gcfg |= CSR_GCFG_GCI_SECURE;
> +	if (env & CSR_GCFG_MATC_ROOT)
> +		gcfg |= CSR_GCFG_MATC_ROOT;
> +
> +	gcfg |= CSR_GCFG_TIT;
> +	write_csr_gcfg(gcfg);
> +
> +	kvm_flush_tlb_all();
> +
> +	/* Enable using TGID  */
> +	set_csr_gtlbc(CSR_GTLBC_USETGID);
> +	kvm_debug("gtlbc:%llx gintc:%llx gstat:%llx gcfg:%llx",
> +			read_csr_gtlbc(), read_csr_gintc(),
> +			read_csr_gstat(), read_csr_gcfg());
> +
> +	return 0;
> +}
> +
> +void kvm_arch_hardware_disable(void)
> +{
> +	clear_csr_gtlbc(CSR_GTLBC_USETGID | CSR_GTLBC_TOTI);
> +	write_csr_gcfg(0);
> +	write_csr_gstat(0);
> +	write_csr_gintc(0);
> +
> +	/* Flush any remaining guest TLB entries */
> +	kvm_flush_tlb_all();
> +}
> +#endif
> +
>   static int kvm_loongarch_env_init(void)
>   {
>   	struct kvm_context *context;
