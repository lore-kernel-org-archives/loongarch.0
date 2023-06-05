Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03912156DE
	for <loongarch@lists.linux.dev>; Mon,  5 Jun 2023 10:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685960329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k2I42yHoa8cBG+5F/vO+XJiYcKmCOnxhW9y167l+rbY=;
	b=G70VAKgPHOcvqqh5JhKGnKW3ZRsZaCy3IdZJAvsfVU480thw/DvvefVQXUXbbwyEOI37GD
	Mekns7PXk7rGkTIUJ+NoOa5QX+k5HPKzVj8y6O3Xah1ZPlmQ9jNXEAlnm5HKJ0O1HMtPxL
	dPwNyzywb3WdTTO/afVe2vtw0W4WSu4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-1sx3kSEuMRSBW3bQrOVpGA-1; Mon, 05 Jun 2023 06:18:48 -0400
X-MC-Unique: 1sx3kSEuMRSBW3bQrOVpGA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-96f4d917e06so627077766b.1
        for <loongarch@lists.linux.dev>; Mon, 05 Jun 2023 03:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685960327; x=1688552327;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k2I42yHoa8cBG+5F/vO+XJiYcKmCOnxhW9y167l+rbY=;
        b=iudZN9r7xnjojh4k3cKb9aUsz921sBPaM/49/mfFHYa4xPdt79TVtVJwuu/H7PGqia
         HBNcdthqMpnFxg9iu53n3WE8/+6kYXf62gjDf3BqFvE+iw/WU4P+9Anom2iTmfJki4py
         Ft4vuul+hc54b7xQadlsofF9DjAcEIwlmDeaQ5yh1dhpeJJRUbQM1lmfIB/Py/qQEjBu
         OBv568iD62DRUtOamm4aEHMTlv2HM/54kB3v3j+EwczTd8MRLG70NL+Bt9iZcLBZOpPq
         x8p84aKUhK2GB+yHTBpw1AY/PnHcxVN/o1q221p0juxFStWLJm2MK08e0Yxl82tWE2XG
         O7NQ==
X-Gm-Message-State: AC+VfDzJwyyr2V7alRlIynsVZK9FJxGyv3O5Oh2BylOmP1qi2jxt6x7o
	sH43d9m90Qqwe4Sgk29Q3jWwkgx/GtQ4qqszkWfEuvjX8QCjRpgdRaeO7m5j8Q1gX1W1yPI0UZC
	qty1jFesXuOT9vSSwCpGw
X-Received: by 2002:a17:906:58d2:b0:974:5a12:546 with SMTP id e18-20020a17090658d200b009745a120546mr5892881ejs.23.1685960327185;
        Mon, 05 Jun 2023 03:18:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4y5FTZMdHhj+OpYwDLDbO7vzaJvoyV4RaoadpCqeL/iBSSvEhdT6Qn1T/bEdAIbL9INizO6w==
X-Received: by 2002:a17:906:58d2:b0:974:5a12:546 with SMTP id e18-20020a17090658d200b009745a120546mr5892862ejs.23.1685960326938;
        Mon, 05 Jun 2023 03:18:46 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c? ([2001:b07:6468:f312:1c09:f536:3de6:228c])
        by smtp.googlemail.com with ESMTPSA id y11-20020a17090629cb00b009660e775691sm4063967eje.151.2023.06.05.03.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 03:18:46 -0700 (PDT)
Message-ID: <e013dd26-40e5-0da7-8648-83fd9906b207@redhat.com>
Date: Mon, 5 Jun 2023 12:18:45 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v12 01/31] LoongArch: KVM: Add kvm related header files
To: Huacai Chen <chenhuacai@kernel.org>,
 Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 WANG Xuerui <kernel@xen0n.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Oliver Upton <oliver.upton@linux.dev>, maobibo@loongson.cn,
 Xi Ruoyao <xry111@xry111.site>
References: <20230530015223.147755-1-zhaotianrui@loongson.cn>
 <20230530015223.147755-2-zhaotianrui@loongson.cn>
 <CAAhV-H6B9M3iN7ugR9hFVxSpDHMgD=biZJbsArx_Uncgk3OHcg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAAhV-H6B9M3iN7ugR9hFVxSpDHMgD=biZJbsArx_Uncgk3OHcg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/5/23 07:00, Huacai Chen wrote:
> I found something like this in our internal repo.
> 
> #define KVM_CAP_LOONGARCH_FPU 228
> #define KVM_CAP_LOONGARCH_LSX 229
> #define KVM_CAP_LOONGARCH_VZ 230
> #define KVM_LOONGARCH_GET_VCPU_STATE    _IOR(KVMIO,   0xd0, struct
> kvm_loongarch_vcpu_state)
> #define KVM_LOONGARCH_SET_VCPU_STATE    _IOW(KVMIO,   0xd1, struct
> kvm_loongarch_vcpu_state)
> #define KVM_LOONGARCH_GET_CPUCFG           _IOR(KVMIO,   0xd2, struct
> kvm_cpucfg)
> #define KVM_LOONGARCH_GET_IOCSR              _IOR(KVMIO,   0xd3,
> struct kvm_iocsr_entry)
> #define KVM_LOONGARCH_SET_IOCSR              _IOW(KVMIO,   0xd4,
> struct kvm_iocsr_entry)
> #define KVM_LOONGARCH_SET_CPUCFG           _IOR(KVMIO,   0xd5, struct
> kvm_cpucfg)
> 
> These are all UAPI definitions, if they are needed (at present or in
> future), they should be merged in the first wave of KVM.

No, dead definitions should never be mergd.

Paolo

