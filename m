Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06102F29
	for <loongarch@lists.linux.dev>; Mon, 20 Feb 2023 18:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676918428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F3F8Gw7wQ/aD89+huyNtH63/PjWUgmmQE0UEbpOsSXw=;
	b=IxhtbeGP4X0Td4JL1cXN5KA62YrlM4xb7wclf6OywBvr+SImLNifOtY5TSlxJmYxQR948m
	DXdUcOs8BW1zavRl/OEifUSTAdo/iGVRDcMUE3pRLRiawy1w381or6CEi3JEgBJ+m8WXrS
	pfey3XoCo88FYm4dRgtzysF6WzaAi1Y=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-4_KEeFmnMDeWQDaIGP7gPw-1; Mon, 20 Feb 2023 13:40:27 -0500
X-MC-Unique: 4_KEeFmnMDeWQDaIGP7gPw-1
Received: by mail-ed1-f71.google.com with SMTP id en10-20020a056402528a00b004acbf564d75so1946132edb.5
        for <loongarch@lists.linux.dev>; Mon, 20 Feb 2023 10:40:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F3F8Gw7wQ/aD89+huyNtH63/PjWUgmmQE0UEbpOsSXw=;
        b=JJbEt2t6p414tam9DDebacBkAE8L+JvHbJ+sqYtyoXc9nrbvv7FrRsyfg9Pu4mgshs
         S14LIcXUKtPDlHcsDNnjvmseiHePR6h1vEKz3gPVUGMt0udqNl0wr/SO54diWYGEFBaZ
         WYV9ty7oWAzKGdeI71PiULfpbxfqtGkJk0e/uiPrITySp/RHEMHChQfIgLnbFWRZUe6P
         fo9lrQTmqAcTwQVq/0wdVb4OFTp5gTigEE5jtRlJTrZ9W+tjx6O86Miknd2YnEI2BAId
         nWj4WtbSMFdoUUIGN/PNjF12GTVxnaOdvB97bDYZgL1S8sKLWkrwk4apLEfR19hAf7qg
         z/BQ==
X-Gm-Message-State: AO0yUKUuy1kSMcl5HHIBmlx4Ec+T3mceRyHpKvlhCJHOgoRXtipmaPCY
	E4WqCAzdAyLIDaTgRjEabo2IFdk/GtTTeiQatOz9r6dcNbZmn5fxUict5mHEkZJzRggLyPmdHl+
	0S/SiHa86KbRuexLFjxXJ
X-Received: by 2002:a17:906:4096:b0:8b1:238b:80ac with SMTP id u22-20020a170906409600b008b1238b80acmr10072776ejj.67.1676918426579;
        Mon, 20 Feb 2023 10:40:26 -0800 (PST)
X-Google-Smtp-Source: AK7set8vaeadSh+WEZgFopd44iTWJVbIBlfL8Loa4pmELIDekvoYycXElcxoWwuFXC46zuNXn+On2Q==
X-Received: by 2002:a17:906:4096:b0:8b1:238b:80ac with SMTP id u22-20020a170906409600b008b1238b80acmr10072757ejj.67.1676918426322;
        Mon, 20 Feb 2023 10:40:26 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5? ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
        by smtp.googlemail.com with ESMTPSA id i10-20020a170906a28a00b008bda61ff999sm3554090ejz.130.2023.02.20.10.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 10:40:25 -0800 (PST)
Message-ID: <06d61407-00b9-812c-e5b3-de585c47ae6b@redhat.com>
Date: Mon, 20 Feb 2023 19:40:24 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 22/29] LoongArch: KVM: Implement handle idle exception
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Oliver Upton <oliver.upton@linux.dev>, maobibo@loongson.cn
References: <20230220065735.1282809-1-zhaotianrui@loongson.cn>
 <20230220065735.1282809-23-zhaotianrui@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230220065735.1282809-23-zhaotianrui@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/20/23 07:57, Tianrui Zhao wrote:
> +int _kvm_emu_idle(struct kvm_vcpu *vcpu)
> +{
> +	++vcpu->stat.idle_exits;
> +	trace_kvm_exit(vcpu, KVM_TRACE_EXIT_IDLE);

Please add a separate tracepoint, don't overload trace_kvm_exit().

Likewise for _kvm_trap_handle_gspr().

I think _kvm_trap_handle_gspr() should have a tracepoint whose parameter 
is inst.word.

Paolo

> +	if (!vcpu->arch.irq_pending) {
> +		kvm_save_timer(vcpu);
> +		kvm_vcpu_block(vcpu);
> +	}
> +
> +	return EMULATE_DONE;

