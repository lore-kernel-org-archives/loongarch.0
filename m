Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2160A8487
	for <loongarch@lists.linux.dev>; Mon, 20 Feb 2023 17:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676915605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A6m99hVi2S7tt6YKMO1cVTA7Dd38UPq4FNBkdwIRSkw=;
	b=GxfWbySwpPgzGdn/Oqby2az2JVlwp6VLiTc/pl8DfcE6b+JslJrFljIIB3rBtVwq/rKtoU
	sc2GSo064fx0s682Df2TqRMdAV+yMqIStwTBbf/6KSxuQRffeUodm0Br3+4l0Q+fZX8up9
	7R3izTFixqqmJuMZZCJ67687nVE/QNQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-551-2-JjA0r3OZG_Ca39c55UNQ-1; Mon, 20 Feb 2023 12:53:24 -0500
X-MC-Unique: 2-JjA0r3OZG_Ca39c55UNQ-1
Received: by mail-ed1-f70.google.com with SMTP id eh16-20020a0564020f9000b004acc4f8aa3fso2560719edb.3
        for <loongarch@lists.linux.dev>; Mon, 20 Feb 2023 09:53:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A6m99hVi2S7tt6YKMO1cVTA7Dd38UPq4FNBkdwIRSkw=;
        b=LRXjzwYLrdvu3fmO1a0YDAJj+C1E3NG/joDkooOUuyk1nWcJRtqO4RZZ1BgBWuzjFB
         C6SA/dC8aHhjc82lYOGpoqQps4BqbX9/4F+4SN2faPtl9bk2/87Y6kNFJN7LPff2vBFN
         ayt9+C6V/55NiHsHVQkHFzrz3M52y3inOdk7VnGKHRATbiii51UQQ1sUqlpkpPZlOEaq
         i0OKPpVZZ5YX92ISyWYEJBfIuXCzJXdDZuGyTeyGN6XWOuJkgHGCPonLB/w6DQEaVYmN
         sWeCv6iBOW3bZxJR8woTegoqs6EVZ2n1jataTo0A91D+8NFZ2Vw+j1R0PyLsIi2ju2OB
         /TKQ==
X-Gm-Message-State: AO0yUKV6fk+/L60SSXsdrncN1dPWTsdB4ZTdr1O9uIy6WaNh5I6GQyT/
	hEP0hfohULG8Kx8X/FsOXUAOibK9c8+BQoRwoaI3n6nx1KuoNfhpVtdOBvhmO5k59v5nE4exIIp
	aDwDLfBtwJb4xkelGk04R
X-Received: by 2002:a17:906:5587:b0:8ae:707:e129 with SMTP id y7-20020a170906558700b008ae0707e129mr11613412ejp.19.1676915602743;
        Mon, 20 Feb 2023 09:53:22 -0800 (PST)
X-Google-Smtp-Source: AK7set8YUMllxoIfXoPvpKgnxtQVrwTWJX8iE/yV2ZHIe2nb+KwqL6pfZmuCO53IKmK9nVaiNrgo/w==
X-Received: by 2002:a17:906:5587:b0:8ae:707:e129 with SMTP id y7-20020a170906558700b008ae0707e129mr11613400ejp.19.1676915602476;
        Mon, 20 Feb 2023 09:53:22 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5? ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
        by smtp.googlemail.com with ESMTPSA id sa14-20020a170906edae00b008b176df2899sm5514793ejb.160.2023.02.20.09.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 09:53:21 -0800 (PST)
Message-ID: <cbd95763-ec38-63f7-89bf-c8b01aa7df77@redhat.com>
Date: Mon, 20 Feb 2023 18:53:20 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 06/29] LoongArch: KVM: Implement vcpu create and
 destroy interface
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Oliver Upton <oliver.upton@linux.dev>, maobibo@loongson.cn
References: <20230220065735.1282809-1-zhaotianrui@loongson.cn>
 <20230220065735.1282809-7-zhaotianrui@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230220065735.1282809-7-zhaotianrui@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/20/23 07:57, Tianrui Zhao wrote:
> +	vcpu->arch.guest_eentry = (unsigned long)kvm_context->kvm_eentry;
> +	vcpu->arch.vcpu_run = kvm_context->kvm_enter_guest;
> +	vcpu->arch.handle_exit = _kvm_handle_exit;

Here as well, whatever is constant must not be stored in struct 
kvm_arch_vcpu.

Paolo

