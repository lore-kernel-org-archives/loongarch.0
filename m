Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C970B8465
	for <loongarch@lists.linux.dev>; Tue, 28 Mar 2023 14:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680013007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=McVfL5jdOZS7kfAfgWz7ZBlWLPWSFJhKhjaCyPWzQL0=;
	b=GnD3nNgHPUrHMdgVDBmOlvT600nCLCzYQGpFebD+unhGOIhyqT4SCbnDfZTK77jK6KbOe8
	4hv2bCAX3ps4roftrwODwseiYSOBRHYH23gayGETf39tr8fUyCcRQlRjGBj2OVzbQObEdI
	RUS8dvCnOrgBkOXcZEblRmA321GY8BI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-fhWN6KaxMTGjecssWnce7w-1; Tue, 28 Mar 2023 10:16:46 -0400
X-MC-Unique: fhWN6KaxMTGjecssWnce7w-1
Received: by mail-ed1-f72.google.com with SMTP id k30-20020a50ce5e000000b00500544ebfb1so17645904edj.7
        for <loongarch@lists.linux.dev>; Tue, 28 Mar 2023 07:16:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680012994;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=McVfL5jdOZS7kfAfgWz7ZBlWLPWSFJhKhjaCyPWzQL0=;
        b=e3mYm/khpNIdnWVUblYpbmu+V7F5gOysrSO7WYLa0pjzU2V0S03UMQAKpJlSUJTOxK
         YfMD54jjsU9nwk6Cr4uSqLp6jlnZD+iFCavyyxF+OfvGmiDMS/uxTlaGL6ArU94+KInW
         5bgyVu0kcjnds20xJw1GEdeps9tyZMb6qb4FlbygXbjHOhD6oFKhSyZzfDA1j9OTlYZN
         7NPZ5GathaHhZEhnXFB0ZfBWALV2YWvKM9ZDybf66RlIsXjFyKrLyUB4o/HpwF7AhTMF
         bzMzIElChokNstc8FCyGbslrWZ5byem5kXgIIbXOe7aTsS/opcu9tXKO3YkNLC/YaW+c
         fYJQ==
X-Gm-Message-State: AAQBX9fxZ19OFjobxZCPSB485UgtNf1hCrkk5P94DwvrGsRMyKwqF6Rn
	/OVRWXIBbmuPlOo3pZo+CfpGTrgn4vmmJrP38lowygNpf/+dekgoFzyMW2rdaaTH6pYdWJeG683
	CBUpWJwnI9b4WppFqqyjv
X-Received: by 2002:a17:906:5a43:b0:8aa:be5c:b7c5 with SMTP id my3-20020a1709065a4300b008aabe5cb7c5mr17112815ejc.41.1680012994691;
        Tue, 28 Mar 2023 07:16:34 -0700 (PDT)
X-Google-Smtp-Source: AKy350aoU2aSW/2CIaXWA1zbjboShcLbK5aGfXZD89zPwYbyXrwZeU0E5CjgejUESFiorIvBi+i+dA==
X-Received: by 2002:a17:906:5a43:b0:8aa:be5c:b7c5 with SMTP id my3-20020a1709065a4300b008aabe5cb7c5mr17112786ejc.41.1680012994437;
        Tue, 28 Mar 2023 07:16:34 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c? ([2001:b07:6468:f312:1c09:f536:3de6:228c])
        by smtp.googlemail.com with ESMTPSA id i11-20020a170906264b00b009255b14e91dsm15283127ejc.46.2023.03.28.07.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 07:16:33 -0700 (PDT)
Message-ID: <e142e2ac-2207-2d97-55b6-fb2ed0e9db89@redhat.com>
Date: Tue, 28 Mar 2023 16:16:32 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PING PATCH v4 00/29] Add KVM LoongArch support
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Oliver Upton <oliver.upton@linux.dev>, maobibo@loongson.cn,
 Xi Ruoyao <xry111@xry111.site>
References: <20230328123119.3649361-1-zhaotianrui@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230328123119.3649361-1-zhaotianrui@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/28/23 14:30, Tianrui Zhao wrote:
> Ping patch series, please help for reviewing the loongarch kvm patch
> set. Thanks very much.
> 
> This series adds KVM LoongArch support. Loongson 3A5000 supports hardware
> assisted virtualization. With cpu virtualization, there are separate
> hw-supported user mode and kernel mode in guest mode. With memory
> virtualization, there are two-level hw mmu table for guest mode and host
> mode. Also there is separate hw cpu timer with consant frequency in
> guest mode, so that vm can migrate between hosts with different freq.
> Currently, we are able to boot LoongArch Linux Guests.
> 
> Few key aspects of KVM LoongArch added by this series are:
> 1. Enable kvm hardware function when kvm module is loaded.
> 2. Implement VM and vcpu related ioctl interface such as vcpu create,
>     vcpu run etc. GET_ONE_REG/SET_ONE_REG ioctl commands are use to
>     get general registers one by one.
> 3. Hardware access about MMU, timer and csr are emulated in kernel.
> 4. Hardwares such as mmio and iocsr device are emulated in user space
>     such as APIC, IPI, pci devices etc.

Please check Documentation/virtual/kvm/api.rst and document the 
loongarch-specific parts of the API, in particular ioctls that have 
architecture-specific semantics (KVM_GET/SET_ONE_REG, KVM_INTERRUPT) and 
vcpu->run fields.

Code-wise what I could understand looked okay, I only made a suggestion 
on the handling of idle; thanks for going through the previous review 
carefully.

Paolo

