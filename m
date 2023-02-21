Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DF0110D
	for <loongarch@lists.linux.dev>; Tue, 21 Feb 2023 07:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676964966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GJUhBSU80naNAyt7KCYwVauVvdFPDJ7F9xsF0ak04fU=;
	b=N6Kj33Z7NDZJBtV3iqTifNVNWNVhj+oIoC/iSL7PK82kbTjSqIoasISRwZg6pmT3dgJkKA
	vDfEIqb4a+m/IUd8xngHAaWBWl9qaNtNPJT6O+36hqT5DFdreJ4NmCgetF74K1SyklZQ/r
	jzQaXtIKUETsUmjlMIyeYdC65C8in3Q=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-414-mY0coSnnOqafm0C2C8W6cg-1; Tue, 21 Feb 2023 02:36:05 -0500
X-MC-Unique: mY0coSnnOqafm0C2C8W6cg-1
Received: by mail-ed1-f72.google.com with SMTP id er17-20020a056402449100b004ad793116d5so3046657edb.23
        for <loongarch@lists.linux.dev>; Mon, 20 Feb 2023 23:36:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GJUhBSU80naNAyt7KCYwVauVvdFPDJ7F9xsF0ak04fU=;
        b=UFVHmIwRDfTTro+zSfabAOLGQ13VaAdc7nxJoRLAdfmFrcfPAwl7W0cA3/hBtqcyHU
         hyw2wYsq8rUTHyWTrwp7vEaorcNKjS12WhLlplElMlUDGm7AFAnDfk8ZcwEuuQDgilGQ
         clXA5OfV2Ujg5qPF//y+wJDt9pPabMLZKKJb1g8B6UuAynsvviJycMKEEq596E2xgTvF
         O7f55QcDqsPpqdZ2KF9NsOdHxMQ//d/EcnPLgIqBRkm2/MBAaa66yT0BJU7Z7E96CQnD
         jmKLmNjdlPsw7fAJ/N0kCG5ypJDAOMKQj+7lVxE1fqzupB0Jy0oyF/9AbkXjUruCuJjV
         R49g==
X-Gm-Message-State: AO0yUKVBbWKeNCuJLb0WTCL4kdatfEHSBMiEEwqS9dc7G2QpLjbLwdlO
	tl1ewIbXc8gQAo6e8qny1PUSk/BMExQq1zAnxB3E8D8r3LQ1WLRKKrlYX+wyfu6KG9K7xasyMdj
	WV/ZFHyPB51ZybE9tIzo31yJgAw==
X-Received: by 2002:a17:906:eca1:b0:87d:eff1:acc8 with SMTP id qh1-20020a170906eca100b0087deff1acc8mr11390839ejb.48.1676964963252;
        Mon, 20 Feb 2023 23:36:03 -0800 (PST)
X-Google-Smtp-Source: AK7set9J1/92GkILe5uy/U98ad25HyMRx/vMAcuPeun433EDTbMLSpuGQJ2VGiRFrZCp9HdNZZQeUw==
X-Received: by 2002:a17:906:eca1:b0:87d:eff1:acc8 with SMTP id qh1-20020a170906eca100b0087deff1acc8mr11390829ejb.48.1676964962981;
        Mon, 20 Feb 2023 23:36:02 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045? ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
        by smtp.googlemail.com with ESMTPSA id z10-20020a170906714a00b008ba365e7e59sm4555423ejj.121.2023.02.20.23.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 23:36:02 -0800 (PST)
Message-ID: <87268dce-1b5d-0556-7e65-2a75a7893cd1@redhat.com>
Date: Tue, 21 Feb 2023 08:35:58 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 05/29] LoongArch: KVM: Add vcpu related header files
To: Xi Ruoyao <xry111@xry111.site>, maobibo <maobibo@loongson.cn>,
 Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Oliver Upton <oliver.upton@linux.dev>
References: <20230220065735.1282809-1-zhaotianrui@loongson.cn>
 <20230220065735.1282809-6-zhaotianrui@loongson.cn>
 <497693ca2cbc443c1d9f796c3aace6c9987bec72.camel@xry111.site>
 <7d6125dd-29e8-14d8-b1d7-d8c14d7bec80@loongson.cn>
 <4cd00b5cdc78da6357d2d326e607b169faee34a8.camel@xry111.site>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <4cd00b5cdc78da6357d2d326e607b169faee34a8.camel@xry111.site>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/21/23 08:12, Xi Ruoyao wrote:
>> We are preparing to submit these instruction support for binutils,
>> however it is still necessary. Supposing that it is supported in future
>> gcc version, we can not drop existing gcc 12/13 supporting to compiling
>> kernel with LoongArch architecture.
> You can drop the support for KVM with less capable Binutils versions,
> like:
> 
> config AS_HAS_LVZ
>      def_bool $(as-instr some_gcsr_insn \$r0, \$gcsr0)
> 
> config KVM
>      depends on AS_HAS_LVZ
> 

There are precedents in Linux for using .word when necessary.  There's 
no reason to prevent using KVM on old Binutils versions.

Paolo

