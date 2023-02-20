Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDC28497
	for <loongarch@lists.linux.dev>; Mon, 20 Feb 2023 18:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676919014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oNEQIMEKzUu2uav8P64r69zff0c8FcvklSUxsToQk9c=;
	b=B2iGCubM1EgoY3r2T0HjtaZyjssca654gV53rqs5FH3StQyM96hjktj+p40iC5EfyEZFME
	dCrlFfHuu3bIkm8O/yBlfOMP+5ZQVF75LRTblAPg2rsPR1eMsGnfH5NsbAP3GQwSnQbE00
	npAsJ+vbDENEiExhl2N7IeVbtw9oybE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-660-3BethDz5MpSaCnGOcNMS8A-1; Mon, 20 Feb 2023 13:50:13 -0500
X-MC-Unique: 3BethDz5MpSaCnGOcNMS8A-1
Received: by mail-ed1-f70.google.com with SMTP id q13-20020a5085cd000000b004af50de0bcfso39336edh.15
        for <loongarch@lists.linux.dev>; Mon, 20 Feb 2023 10:50:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oNEQIMEKzUu2uav8P64r69zff0c8FcvklSUxsToQk9c=;
        b=TIJyUysxYzoyH6+MTtiqhwiAGm1q4PvU34drTU2PSW7pA0GKLIXDhorZn3+GN5YP5H
         1B+6V3A1uXbRIBoyzoZs3CQAYI811ZOiuGXJoaTU/hjgZ8x/6qqR8Mt7dwFPsepEldPi
         pB3Of5Hpeewo8HdpUckxrXyAEWlwlSszVaOLsnB3s4OM3MVlcJfk2AFVyD9AxFd4u8H/
         KAXfus7jDXhebHFmCNe1yb/UK6SRnJOYqIF50TShmHYjjkRlSXRrbGEnI3V2N4NBkfXZ
         3W8eGIlexDihCgHtgjVi1+tzjQtxpWMG2bOTtVyRPB1i1UngXO7RQjAyZ5Ho8MJDs6bB
         HZvQ==
X-Gm-Message-State: AO0yUKXrdk/jLWrdA26etk11mSvYI+/8XixW5XmVycKsGGttLWngyoQo
	pNzqRl+3iU3sRtHTzg4Q6gV7eAmjeqjZbHIdmJAVT1k11+IYzaZ8o4+IrSfXp3iQb1Fyefh5bUU
	QVNR1shJN70O6/8bgM9VH
X-Received: by 2002:a17:906:2413:b0:86c:a3ed:1442 with SMTP id z19-20020a170906241300b0086ca3ed1442mr8756810eja.4.1676919011914;
        Mon, 20 Feb 2023 10:50:11 -0800 (PST)
X-Google-Smtp-Source: AK7set/xFOW7y3n8LAi7Lq4oM1pBvG3AfNA2jHHJRrTVLW3aX4k0F1SjGK9u/iFMGDvuf2vLJ5sZqg==
X-Received: by 2002:a17:906:2413:b0:86c:a3ed:1442 with SMTP id z19-20020a170906241300b0086ca3ed1442mr8756797eja.4.1676919011664;
        Mon, 20 Feb 2023 10:50:11 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5? ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
        by smtp.googlemail.com with ESMTPSA id fq30-20020a1709069d9e00b008ce5b426d77sm2194511ejc.13.2023.02.20.10.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 10:50:11 -0800 (PST)
Message-ID: <918d0522-56ac-49c3-6604-f44a58ddc645@redhat.com>
Date: Mon, 20 Feb 2023 19:50:10 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 13/29] LoongArch: KVM: Implement misc vcpu related
 interfaces
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Oliver Upton <oliver.upton@linux.dev>, maobibo@loongson.cn
References: <20230220065735.1282809-1-zhaotianrui@loongson.cn>
 <20230220065735.1282809-14-zhaotianrui@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230220065735.1282809-14-zhaotianrui@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/20/23 07:57, Tianrui Zhao wrote:
> +
> +int kvm_arch_vcpu_ioctl_translate(struct kvm_vcpu *vcpu,
> +				  struct kvm_translation *tr)
> +{
> +	return 0;
> +}
> +

Please return -EINVAL instead.

Paolo

