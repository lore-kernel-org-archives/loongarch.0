Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1B48487
	for <loongarch@lists.linux.dev>; Mon, 20 Feb 2023 18:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676917336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/gpJAHMzCGZDzd5ahHH1dkmWAXlvJ43+tMHBJHsRtPc=;
	b=RDuH9IUusqNQ3Hk8GUAYnian4eMOFc54Y1nuTBg72+k2SNdWYeLzhNCTCnvQLwkEtH5G2o
	NEU/Adj9QC4brq0FrOCeOswUDx3VJaQYpIxTAxsq3TRkZ0oTNuDEKe/dSpIgyRIuU8G0lA
	cegm5myXqWBiRzLD6gytBSq69l175jo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-4gQz6BccPpeG4yQC8Hh19w-1; Mon, 20 Feb 2023 13:22:14 -0500
X-MC-Unique: 4gQz6BccPpeG4yQC8Hh19w-1
Received: by mail-ed1-f72.google.com with SMTP id eh16-20020a0564020f9000b004acc4f8aa3fso2631082edb.3
        for <loongarch@lists.linux.dev>; Mon, 20 Feb 2023 10:22:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/gpJAHMzCGZDzd5ahHH1dkmWAXlvJ43+tMHBJHsRtPc=;
        b=7rUroThZHg3e/61TQMxV2aSP9Ro7vo/GKCjJMjIQwH38PlnO5y6U4B4a0sSS98ojvh
         BaPHN1yxt9oeDBXrwzVj84Gu7EkaSgscuymn54usKiKAJpUcV3qb8ebK+ReF8BiYsL0b
         Kw8KS3jTlLY7HHYSUHzwqk3ex9cDk6g9c+LEffP2YHA9oeovj3bozvSjEoB10pnpI2iw
         dSC9o0hc7izLonEDz9q3wkxg7VZTxEyJqD/Kcf1HCqs/uSUn7LhDX8cOYfMu00RsxoWo
         uLd/Fy1u/HQi37y0Kqo+kJ9B4PZCu7MgPXkFyWOqohNJzA9LG1FlIPmLd1+3gZGQfDEV
         CQPA==
X-Gm-Message-State: AO0yUKVQ+pQjnSKCDJxOvH6ylD7pxgcUiFjwqHWu6j+taeYTOr6fvsmN
	Q6YDOa+gE4jaobyAmXVTxHObtckMAuZjUQ80Msdvm0DjIcWbA9l/az3e7xN1OpKDjrFAHFCd5zV
	YMRtbsrOZMPelrphZgoj6
X-Received: by 2002:aa7:cace:0:b0:4ad:7abe:f41a with SMTP id l14-20020aa7cace000000b004ad7abef41amr1229471edt.25.1676917333721;
        Mon, 20 Feb 2023 10:22:13 -0800 (PST)
X-Google-Smtp-Source: AK7set+4CVGpOiWcW9kTs3XQyKjwDB5XGYxKs1Buak8GTZGSmZIwhKKOoqXKiHsWLcJdCkgfgPMdUA==
X-Received: by 2002:aa7:cace:0:b0:4ad:7abe:f41a with SMTP id l14-20020aa7cace000000b004ad7abef41amr1229456edt.25.1676917333441;
        Mon, 20 Feb 2023 10:22:13 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5? ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
        by smtp.googlemail.com with ESMTPSA id y36-20020a50bb27000000b004ac54d4da22sm6572247ede.71.2023.02.20.10.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 10:22:12 -0800 (PST)
Message-ID: <2b047b75-7397-0cce-e7af-ebba67ae2561@redhat.com>
Date: Mon, 20 Feb 2023 19:22:11 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Oliver Upton <oliver.upton@linux.dev>, maobibo@loongson.cn
References: <20230220065735.1282809-1-zhaotianrui@loongson.cn>
 <20230220065735.1282809-2-zhaotianrui@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 01/29] LoongArch: KVM: Add kvm related header files
In-Reply-To: <20230220065735.1282809-2-zhaotianrui@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/20/23 07:57, Tianrui Zhao wrote:
> +
> +/* Resume Flags */
> +#define RESUME_FLAG_DR		(1<<0)	/* Reload guest nonvolatile state? */
> +#define RESUME_FLAG_HOST	(1<<1)	/* Resume host? */
> +
> +#define RESUME_GUEST		0
> +#define RESUME_GUEST_DR		RESUME_FLAG_DR
> +#define RESUME_HOST		RESUME_FLAG_HOST
> +

Most of this code is dead, I'll give more instructions in a reply to 
patch 8.

> +	unsigned long guest_eentry;
> +	unsigned long host_eentry;
> +	int (*vcpu_run)(struct kvm_run *run, struct kvm_vcpu *vcpu);
> +	int (*handle_exit)(struct kvm_run *run, struct kvm_vcpu *vcpu);
> +
> +	/* Host registers preserved across guest mode execution */
> +	unsigned long host_stack;
> +	unsigned long host_gp;
> +	unsigned long host_pgd;
> +	unsigned long host_pgdhi;
> +	unsigned long host_entryhi;
> +
> +	/* Host CSR registers used when handling exits from guest */
> +	unsigned long badv;
> +	unsigned long host_estat;
> +	unsigned long badi;
> +	unsigned long host_ecfg;
> +	unsigned long host_percpu;
> +
> +	/* GPRS */
> +	unsigned long gprs[32];
> +	unsigned long pc;
> +
> +	/* FPU State */
> +	struct loongarch_fpu fpu FPU_ALIGN;
> +	/* Which auxiliary state is loaded (KVM_LOONGARCH_AUX_*) */
> +	unsigned int aux_inuse;
> +
> +	/* CSR State */
> +	struct loongarch_csrs *csr;
> +
> +	/* GPR used as IO source/target */
> +	u32 io_gpr;
> +
> +	struct hrtimer swtimer;
> +	/* Count timer control KVM register */
> +	u32 count_ctl;
> +
> +	/* Bitmask of exceptions that are pending */
> +	unsigned long irq_pending;
> +	/* Bitmask of pending exceptions to be cleared */
> +	unsigned long irq_clear;
> +
> +	/* Cache some mmu pages needed inside spinlock regions */
> +	struct kvm_mmu_memory_cache mmu_page_cache;
> +
> +	/* vcpu's vpid is different on each host cpu in an smp system */
> +	u64 vpid[NR_CPUS];

In _kvm_check_vmid(), you already have

+	if (migrated || (ver != old)) {
+		_kvm_update_vpid(vcpu, cpu);
+		trace_kvm_vpid_change(vcpu, vcpu->arch.vpid[cpu]);
+	}

so a vpid will never be recycled if a vCPU migrates from physical CPU A 
to B and back to A.

So please keep the current VPID in the per-cpu struct vmcs, and you can 
just copy it from there in _kvm_check_vmid().

> +	/* Period of stable timer tick in ns */
> +	u64 timer_period;
> +	/* Frequency of stable timer in Hz */
> +	u64 timer_mhz;
> +	/* Stable bias from the raw time */
> +	u64 timer_bias;
> +	/* Dynamic nanosecond bias (multiple of timer_period) to avoid overflow */
> +	s64 timer_dyn_bias;
> +	/* Save ktime */
> +	ktime_t stable_ktime_saved;
> +
> +	u64 core_ext_ioisr[4];
> +
> +	/* Last CPU the VCPU state was loaded on */
> +	int last_sched_cpu;
> +	/* Last CPU the VCPU actually executed guest code on */
> +	int last_exec_cpu;
> +
> +	u8 fpu_enabled;

This field is always true, please remove it.

> +	struct kvm_guest_debug_arch guest_debug;

This struct is empty, please remove it.

Paolo

