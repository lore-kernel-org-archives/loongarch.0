Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B03A110D
	for <loongarch@lists.linux.dev>; Tue, 21 Feb 2023 06:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676962195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QdGXGjyDjWDQeQBBtOyLZqj5HnH8aK5CO5+LaSjE4fA=;
	b=cOvuhN2uDVrjYUefuHSnBGCUmDSGD/9bcQE4iPxUTY18VW/f2JNSPM6d0kOxzowbKLm7eL
	W60V6UZ4SwwPAhXxMMFq2Gy3gtlm2g1NYNkdizc1ww03OljLm8Ve8Upp1wA5n5mlnA5Pub
	xMCNHjPK9x7aAz5TNjMdvtEy9eE5IHo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-5Zkcxt9INT-NbYbr0eG5WQ-1; Tue, 21 Feb 2023 01:49:53 -0500
X-MC-Unique: 5Zkcxt9INT-NbYbr0eG5WQ-1
Received: by mail-ed1-f70.google.com with SMTP id g24-20020a056402321800b004ace77022ebso4642518eda.8
        for <loongarch@lists.linux.dev>; Mon, 20 Feb 2023 22:49:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QdGXGjyDjWDQeQBBtOyLZqj5HnH8aK5CO5+LaSjE4fA=;
        b=VRIyYz+vWCdjHKxswD0pJJFI3XiTqwC8O+zhKw8Hr5Q5GyrYMG25gR6A8S7x5eCU7F
         NUoHyVkA9Jae1mtMUWPGAfAJkziLuZXDq9Oq0UhAve+XdCHqL2G7g31Pct/6lZZlCVpi
         1fmQ+dyJ7R+KHA/klFV8R6iHqQmYfBxWeWeOK35p1xJF95jQw/bblfQj/f6Qwc2Z111M
         mS8WIowcTEuWDEb++rM8w+lsoA4gx/sjgZGRwMzJcjiPkGAiK19/89cCEUZ7FcupgZ2R
         mwiIoZhwwtMJITomjrkzwPHmaT3K0Lp2SDsBIY3P6B0cJE+GdroIqlZGrIeSDMwh6CQb
         QNFw==
X-Gm-Message-State: AO0yUKWHehUIpjK+vL4+kiHR2xLKow0s6vR3OwChuCWOLHfILQ66bSmj
	uIpxxqQqCQ39DNfl4b4Wj0oyxbkbejXk1ri7rs79QAnsatWgoG6lr5i4tjwo30XSHch1NxfiwYn
	DtqzDUD1vsWVanDyIqoqK
X-Received: by 2002:a17:907:2141:b0:8b1:264d:6187 with SMTP id rk1-20020a170907214100b008b1264d6187mr11442074ejb.46.1676962191316;
        Mon, 20 Feb 2023 22:49:51 -0800 (PST)
X-Google-Smtp-Source: AK7set/ANd+6fZun4U0ZKRNIdNMLK+fkVCSMqAKCf5G8i3f2jg6at5qAA1YS1LeNyQ9x9mWYKIHDHQ==
X-Received: by 2002:a17:907:2141:b0:8b1:264d:6187 with SMTP id rk1-20020a170907214100b008b1264d6187mr11442065ejb.46.1676962191043;
        Mon, 20 Feb 2023 22:49:51 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045? ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
        by smtp.googlemail.com with ESMTPSA id gc20-20020a1709072b1400b008d85435f914sm1680469ejc.98.2023.02.20.22.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 22:49:50 -0800 (PST)
Message-ID: <d6e794c7-4741-a656-07ae-1cad4c26d93e@redhat.com>
Date: Tue, 21 Feb 2023 07:49:49 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 01/29] LoongArch: KVM: Add kvm related header files
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Oliver Upton <oliver.upton@linux.dev>, maobibo@loongson.cn
References: <20230220065735.1282809-1-zhaotianrui@loongson.cn>
 <20230220065735.1282809-2-zhaotianrui@loongson.cn>
 <2b047b75-7397-0cce-e7af-ebba67ae2561@redhat.com>
 <c9dada46-829c-d3cd-c3b6-68a570552e84@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <c9dada46-829c-d3cd-c3b6-68a570552e84@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/21/23 03:56, Tianrui Zhao wrote:
>>
>> In _kvm_check_vmid(), you already have
>>
>> +    if (migrated || (ver != old)) {
>> +        _kvm_update_vpid(vcpu, cpu);
>> +        trace_kvm_vpid_change(vcpu, vcpu->arch.vpid[cpu]);
>> +    }
>>
>> so a vpid will never be recycled if a vCPU migrates from physical CPU 
>> A to B and back to A.
>>
>> So please keep the current VPID in the per-cpu struct vmcs, and you 
>> can just copy it from there in _kvm_check_vmid().
> 
> Thanks,  that is to say we should remove the vpid[NR_CPUS] array and it 
> is enough to use only one vpid variable?

Yes, you need a vpid variable here and one in struct kvm_context.

Paolo

