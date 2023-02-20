Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574A37ED
	for <loongarch@lists.linux.dev>; Mon, 20 Feb 2023 17:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676915204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hWZIjcrYwrJWS0SnFQ4J1tbY58nVFYJ+Qq2znZbe+pI=;
	b=LgKbulYQaqdOmEYgiNkmvnGx/4vLEiv/Nt+VNPzQYrrvIioljIcvctOn50PrSK/yGYdxtO
	MLBSPl8bcu/bmdaOQPpxsXh9VkIadI2xd/fDRehrCyDRQ6/55EvMLfsuCo0qzk90O4jE0i
	Oz5tvhCgs7yI6G5MUmYm5x6R8SFlDBQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594-7NziGmwsMfq-QRiHtyRfAQ-1; Mon, 20 Feb 2023 12:46:41 -0500
X-MC-Unique: 7NziGmwsMfq-QRiHtyRfAQ-1
Received: by mail-ed1-f70.google.com with SMTP id en10-20020a056402528a00b004acbf564d75so1818815edb.5
        for <loongarch@lists.linux.dev>; Mon, 20 Feb 2023 09:46:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWZIjcrYwrJWS0SnFQ4J1tbY58nVFYJ+Qq2znZbe+pI=;
        b=pb7bdyaEXpfO1wLpPKhbZX7oNIgOPnv5J5WCFtulWdXpHCV+ALZ3lI5PkpGeV6pG37
         BYlDMMoRA2wSNSLc/LQn1KhamkaPzFvMjKPY/7UfZ8sC5mfbhdtotoAFRyKqN/kcMK5R
         mVKfHySzRhv5ZqLbtBZb4cIiW7UWfitKQ1uVvxYUC+E7gUgehflq0kThOo0WuxVrBz2E
         GSGJ0OPgEfoGQANArFi0np/H1jnQzAsTouUKFDbfIXR2jFdVEHVlkDPueje/6//DjlzQ
         OYJrOvow3kzoh0X/NOGw8XO7sWmW1AkAh2ZVK4TZzd2OJn+vc9mQ3rdmVxvQ0maatFtn
         hklw==
X-Gm-Message-State: AO0yUKVbasvXmfnjePQauwqGhS5eli5F0UmRvLLrIzAqLE9hgZBvipVc
	cM3ZHTS6Wevl5+KhBrvP7tTbztTNPlVBt3faVBrkZ5FBfnytM0oeWWxb8b8BJaHzAHJrh1Cf6Y9
	Z95aypS7D57KiNVtZaDLs
X-Received: by 2002:a17:906:c55:b0:8b1:7dea:cc40 with SMTP id t21-20020a1709060c5500b008b17deacc40mr13014037ejf.9.1676915200203;
        Mon, 20 Feb 2023 09:46:40 -0800 (PST)
X-Google-Smtp-Source: AK7set/4M5AqthPWPDaHqd+T/52TERaZwpNY5aFMq33k0a6rEitA+IBF394l4ksyh+KMrx6UqRgCxQ==
X-Received: by 2002:a17:906:c55:b0:8b1:7dea:cc40 with SMTP id t21-20020a1709060c5500b008b17deacc40mr13014024ejf.9.1676915199884;
        Mon, 20 Feb 2023 09:46:39 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5? ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
        by smtp.googlemail.com with ESMTPSA id m18-20020a17090607d200b008d044ede804sm1872252ejc.163.2023.02.20.09.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 09:46:39 -0800 (PST)
Message-ID: <4c501e8e-6981-814e-4fec-71a56363711b@redhat.com>
Date: Mon, 20 Feb 2023 18:46:38 +0100
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
 <20230220065735.1282809-9-zhaotianrui@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 08/29] LoongArch: KVM: Implement vcpu handle exit
 interface
In-Reply-To: <20230220065735.1282809-9-zhaotianrui@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/20/23 07:57, Tianrui Zhao wrote:
> +	if (ret == RESUME_GUEST)
> +		kvm_acquire_timer(vcpu);
> +
> +	if (!(ret & RESUME_HOST)) {
> +		_kvm_deliver_intr(vcpu);
> +		/* Only check for signals if not already exiting to userspace */
> +		if (signal_pending(current)) {
> +			run->exit_reason = KVM_EXIT_INTR;
> +			ret = (-EINTR << 2) | RESUME_HOST;
> +			++vcpu->stat.signal_exits;
> +			trace_kvm_exit(vcpu, KVM_TRACE_EXIT_SIGNAL);
> +		}
> +	}
> +
> +	if (ret == RESUME_GUEST) {
> +		trace_kvm_reenter(vcpu);
> +
> +		/*
> +		 * Make sure the read of VCPU requests in vcpu_reenter()
> +		 * callback is not reordered ahead of the write to vcpu->mode,
> +		 * or we could miss a TLB flush request while the requester sees
> +		 * the VCPU as outside of guest mode and not needing an IPI.
> +		 */
> +		smp_store_mb(vcpu->mode, IN_GUEST_MODE);
> +
> +		cpu = smp_processor_id();
> +		_kvm_check_requests(vcpu, cpu);
> +		_kvm_check_vmid(vcpu, cpu);
> +		vcpu->arch.host_eentry = csr_read64(LOONGARCH_CSR_EENTRY);
> +
> +		/*
> +		 * If FPU are enabled (i.e. the guest's FPU context
> +		 * is live), restore FCSR0.
> +		 */
> +		if (_kvm_guest_has_fpu(&vcpu->arch) &&
> +			read_csr_euen() & (CSR_EUEN_FPEN)) {
> +			kvm_restore_fcsr(&vcpu->arch.fpu);
> +		}
> +	}

Please avoid copying code from arch/mips/kvm since it's already pretty ugly.

