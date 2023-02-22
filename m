Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7E65384
	for <loongarch@lists.linux.dev>; Wed, 22 Feb 2023 12:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677068250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=goul4Fhvfk43vCc860FayPZUVbj7HGLTXeMvhYOcsh0=;
	b=CkPhquxiQWsvafBi/fkRE01r5Dae6+53Mufk8B+ReRIUsPqvvpGywaQERDkMLOnvYmsDY7
	Avo8A4Z8NrB/K2RPC/lwOXXZGuDsMmhMjwfDnzsmYwiSwWpuY0iKIYZk6b8ZyoYC80EJKM
	VhEYi6aJms7JOJH6ixcPhD7361sHxBs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-135-kaxZ85wvORiTVe1TEM-eqw-1; Wed, 22 Feb 2023 07:17:29 -0500
X-MC-Unique: kaxZ85wvORiTVe1TEM-eqw-1
Received: by mail-ed1-f70.google.com with SMTP id t9-20020a056402524900b004af59c073abso5091581edd.6
        for <loongarch@lists.linux.dev>; Wed, 22 Feb 2023 04:17:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=goul4Fhvfk43vCc860FayPZUVbj7HGLTXeMvhYOcsh0=;
        b=dnfP+4Np2tvVGHamCHmqpFZcjdpnioTt/yIfZM132zbTfAN7Crwu4rVlpXtrRLlKXp
         XixPojPusqw7egALLDTTVzkm5702dRDCeyvbmasrtE4ICyI8YXXn2VN0bnaqSRZIsUKq
         MZUq2qvbocUuT3fYFCDymKTw3UG5jVkgVfcMuTQxuhwBUXOHH291u5y7tL+SzmhjSyGT
         VZ26WV9hZYuzDma3AKuo/FgQAB0wETNGb+gBWWEE6ZcRwUlTyMkCZJB4gm1b1dTHr2Gr
         6fw80yqMK4MW3FvEEW9jZZDSxvT+RvxcjVUUXKh1pkwsi+5Lfaq2FSxeUbxSaNWGS+19
         V3kQ==
X-Gm-Message-State: AO0yUKX418prasIFKO2qlkGbOh3jE7/MdOi7R7y4vy7MNFxUJ/KXH+DX
	tNK/my7GKhnT4x73chVg/8Hx5nr3zwr/0gmANAVeCoOwKnoStFv2Qojww+fhk/c4sIHe+qNEtP/
	GD+jnAFUeGppZTH4Y3kB7
X-Received: by 2002:aa7:ccc6:0:b0:4ad:d4b9:f8f4 with SMTP id y6-20020aa7ccc6000000b004add4b9f8f4mr8172169edt.8.1677068248251;
        Wed, 22 Feb 2023 04:17:28 -0800 (PST)
X-Google-Smtp-Source: AK7set+3d7Z+mzeZfVcH9q2/QwKk/+Du//iEo4lNyoG0L3TyJI3S5+479TSrRz5mFMr/NTPfpxKX0w==
X-Received: by 2002:aa7:ccc6:0:b0:4ad:d4b9:f8f4 with SMTP id y6-20020aa7ccc6000000b004add4b9f8f4mr8172146edt.8.1677068247919;
        Wed, 22 Feb 2023 04:17:27 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id m27-20020a50d7db000000b004acc61206cfsm2594721edj.33.2023.02.22.04.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 04:17:27 -0800 (PST)
Message-ID: <a9623c91-a28a-d91d-5311-fcfc4bd13247@redhat.com>
Date: Wed, 22 Feb 2023 13:17:25 +0100
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
 <20230220065735.1282809-7-zhaotianrui@loongson.cn>
 <cbd95763-ec38-63f7-89bf-c8b01aa7df77@redhat.com>
 <abfa3fbc-e234-d0ab-ec35-90d9c251bf79@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 06/29] LoongArch: KVM: Implement vcpu create and
 destroy interface
In-Reply-To: <abfa3fbc-e234-d0ab-ec35-90d9c251bf79@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/22/23 02:52, Tianrui Zhao wrote:
>>
>>> +    vcpu->arch.guest_eentry = (unsigned long)kvm_context->kvm_eentry;
>>> +    vcpu->arch.vcpu_run = kvm_context->kvm_enter_guest;
>>> +    vcpu->arch.handle_exit = _kvm_handle_exit;
>>
>> Here as well, whatever is constant must not be stored in struct 
>> kvm_arch_vcpu.
>>
>> Paolo
> 
> Thanks,  we use this in vcpu_arch because the vcpu_arch is used as 
> argument in switch.S' methods, we can quickly access the guest_eentry 
> and handle_exit by using the  KVM_ARCH_GEENTRY, KVM_ARCH_HANDLE_EXIT 
> offsets. If we change to global variable ,  we should relocate it in 
> switch.S and may lead  to lower accessing speed.

For guest_eentry and handle_exit this is correct so you can add a 
comment in kvm_host.h, like

	/* Pointers stored here for easy access from assembly code.  */

However, vcpu->arch.vcpu_run is not used in switch.S so there is no need 
to store it in struct kvm_arch_vcpu.  Since you're already going to move 
kvm_enter_guest out of kvm_context and into a global variable, please 
give it the right pointer-to-function type instead of using unsigned long.

Paolo

