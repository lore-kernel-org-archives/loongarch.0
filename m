Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999442F29
	for <loongarch@lists.linux.dev>; Mon, 20 Feb 2023 18:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676918687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5o6eRTQNfDmApvYWeJ5Fj/h2ml291ODKP5nMoklmwOg=;
	b=axs1HljxYlNniipImmcz8h5/Yz5PZo6cgsEObn5l4n6FEjOnh3G3gCj1HF9Lt7bQot6yq9
	NO0xVxGUd5hMwTzkmW8vz7LQMlH2mzUwmWAVX2gdsCEqGvzHV2JO0NTTL+VhEQDEG8Kn/D
	tvIH/vTHjge6sic/KgT+fdXtOoQ4Qro=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-fbjYPAN5PLWXRIqIhvxcKw-1; Mon, 20 Feb 2023 13:44:45 -0500
X-MC-Unique: fbjYPAN5PLWXRIqIhvxcKw-1
Received: by mail-ed1-f71.google.com with SMTP id c1-20020a0564021f8100b004acbe232c03so2498586edc.9
        for <loongarch@lists.linux.dev>; Mon, 20 Feb 2023 10:44:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5o6eRTQNfDmApvYWeJ5Fj/h2ml291ODKP5nMoklmwOg=;
        b=adhSETPmBIlcFZNSo5FLq1VRC+U70nAkzJLyppdOncTr/0Obefxl6MOL4JAwCRJuQ2
         AOQmwVkjS5xbQYL3yJQbhCkWzIM5iaqtW/gbrgDA33kwyPGpTIjRR2SiGAhea6r0BBKv
         SqdOJS1Om81pVBco2D+C3K9UsxlRWo/mWI1P9exnxyW6K4l8fvXSkqtAbmC3yhjjpEFI
         dli4eUogXVhkPa/5+X5N6prT+OhDOMmFi4VW020/p0bx3j5w8cdyv75rZK4CWVG9vCkZ
         svuoHwU5yStM/3JUbOvl+dAx8Kz7aBN4nUgN+zfU5lMqkcJZBUl2iRnIY7MgH+nGczqT
         erDQ==
X-Gm-Message-State: AO0yUKXgwGao4behKobwN4jzgXutyVCXJiOwGhBfkeITnVmRTHPQrpU7
	VUOFFFLrxO5+l8noj0xOAYZqhH4UD8ABr4OGzt3tZoLWbjX+h0wkHKUmvxseQ+ORXZV911tmz0O
	pe85h7fHPxn/6U/H/pSf8
X-Received: by 2002:a17:907:7288:b0:8bc:9bce:7eb6 with SMTP id dt8-20020a170907728800b008bc9bce7eb6mr11093425ejc.7.1676918684886;
        Mon, 20 Feb 2023 10:44:44 -0800 (PST)
X-Google-Smtp-Source: AK7set9ocE67SLza6haA31oEbJHJRcyYUHybtxqKgcJJvEaEBloE29nx4Mt4k9LeCQov7jkXoVJscw==
X-Received: by 2002:a17:907:7288:b0:8bc:9bce:7eb6 with SMTP id dt8-20020a170907728800b008bc9bce7eb6mr11093401ejc.7.1676918684569;
        Mon, 20 Feb 2023 10:44:44 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5? ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
        by smtp.googlemail.com with ESMTPSA id u20-20020a1709064ad400b008d21431e705sm1751526ejt.84.2023.02.20.10.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 10:44:44 -0800 (PST)
Message-ID: <489768bf-34e1-305b-9264-cdb1cebf3be2@redhat.com>
Date: Mon, 20 Feb 2023 19:44:43 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 07/29] LoongArch: KVM: Implement vcpu run interface
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Oliver Upton <oliver.upton@linux.dev>, maobibo@loongson.cn
References: <20230220065735.1282809-1-zhaotianrui@loongson.cn>
 <20230220065735.1282809-8-zhaotianrui@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230220065735.1282809-8-zhaotianrui@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/20/23 07:57, Tianrui Zhao wrote:
> +	lose_fpu(1);

Is this enough to clear CSR_EUEN_FPEN?

Paolo

