Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23037ED
	for <loongarch@lists.linux.dev>; Mon, 20 Feb 2023 17:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676915181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ck/8YAQ6br4cg4ndwhAICwHSU+oSs0QdaDqjZp8nNfE=;
	b=D8Jilf6to6LqQ5fttr2vt2BOjQDwMzw9V9PqwzjKtsZtgus3F1jU2gnfG8Uot2bCZBTHyj
	9q1PQSxAUgEKb1TBBI2iIXDs/Z/EMWu7oCHkLDMBnuYhzO7iCgMv8w5jTFxVpWT4T+3HId
	llOLE+Z8Dmg99ZGAkGjwrYNthWokbFU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-VKeTUvDOMPq7WdtcREwKPg-1; Mon, 20 Feb 2023 12:46:20 -0500
X-MC-Unique: VKeTUvDOMPq7WdtcREwKPg-1
Received: by mail-ed1-f72.google.com with SMTP id b1-20020aa7dc01000000b004ad062fee5eso2474849edu.17
        for <loongarch@lists.linux.dev>; Mon, 20 Feb 2023 09:46:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ck/8YAQ6br4cg4ndwhAICwHSU+oSs0QdaDqjZp8nNfE=;
        b=D9+TefoFZQOZNbZrdoEHRjvcU2Bl/fWRV0uvFFVGdoloSzKpg2tDt4sncJ1AYabQJJ
         vez4V0oXwWEx/jBnBajdo+z6MnDlUBi4hCAaxUwZDN3QPBFgltAxsGVIQpBE71kVfzXO
         JGKfxp+wvMLUEY+fLqgEU7bjEo95hQUdtFTrEA4ztx34A3b+ThowJ84ZO7EfI9S305jy
         BMWEcy/D5Fr7Q/UCvKnR1iA9lNG2bzjb/PVI3OnZSMQdgF06oYMNBo097TNomNe/1KlM
         wIbz2aAVoonymnmr8VvkPZK6Ut4ye+IUhr400LTmbBBsnjWHWv8aKOxdG+lC9YKd0C57
         vPzg==
X-Gm-Message-State: AO0yUKXw8iUq8Cg1zMhsrhltDZO/S4wFykNog2ZWzoK6uZUaIJUTfSqf
	qnb6i3OiUcJmUdat3QUkdSwF3ZK+fVQHIsl1DwlqnNjOnCClfwkA9jGxE7/kWZknWyyT+3uwgtZ
	KYXMrWkPx6uEjXxfjYXNy
X-Received: by 2002:a17:907:9714:b0:8b1:7eba:de5 with SMTP id jg20-20020a170907971400b008b17eba0de5mr9354782ejc.10.1676915179027;
        Mon, 20 Feb 2023 09:46:19 -0800 (PST)
X-Google-Smtp-Source: AK7set/Tg+D8jplbtCuUA/KAbL7Qq6RReoePpMuhnouFw3R+uTK3cUHQ5gyse11r3SB4HbH+iQqFqw==
X-Received: by 2002:a17:907:9714:b0:8b1:7eba:de5 with SMTP id jg20-20020a170907971400b008b17eba0de5mr9354767ejc.10.1676915178760;
        Mon, 20 Feb 2023 09:46:18 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5? ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
        by smtp.googlemail.com with ESMTPSA id ce6-20020a170906b24600b008b1fc59a22esm4860751ejb.65.2023.02.20.09.46.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 09:46:18 -0800 (PST)
Message-ID: <bf4111f9-f722-1847-4f1d-964c5356f392@redhat.com>
Date: Mon, 20 Feb 2023 18:46:16 +0100
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
 <20230220065735.1282809-3-zhaotianrui@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 02/29] LoongArch: KVM: Implement kvm module related
 interface
In-Reply-To: <20230220065735.1282809-3-zhaotianrui@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/20/23 07:57, Tianrui Zhao wrote:
> +	order = get_order(kvm_vector_size + kvm_enter_guest_size);
> +	addr = (void *)__get_free_pages(GFP_KERNEL, order);
> +	if (!addr) {
> +		free_percpu(vmcs);
> +		return -ENOMEM;
> +	}
> +
> +	memcpy(addr, kvm_vector_entry, kvm_vector_size);
> +	memcpy(addr + kvm_vector_size, kvm_enter_guest, kvm_enter_guest_size);
> +	flush_icache_range((unsigned long)addr, (unsigned long)addr +
> +				kvm_vector_size + kvm_enter_guest_size);
> +
> +	vpid_mask = read_csr_gstat();
> +	vpid_mask = (vpid_mask & CSR_GSTAT_GIDBIT) >> CSR_GSTAT_GIDBIT_SHIFT;
> +	if (vpid_mask)
> +		vpid_mask = GENMASK(vpid_mask - 1, 0);
> +
> +	for_each_possible_cpu(cpu) {
> +		context = per_cpu_ptr(vmcs, cpu);
> +		context->vpid_mask = vpid_mask;
> +		context->vpid_cache = context->vpid_mask + 1;
> +		context->last_vcpu = NULL;
> +		context->kvm_eentry = addr;
> +		context->kvm_enter_guest = addr + kvm_vector_size;
> +		context->page_order = order;
> +	}

A lot of these variables are constant across all pCPUs, any reason to 
have them in a per-CPU variable?  Likewise, since they are all the same 
as the constant global vmcs variable, why make them part of struct 
kvm_context instead of just making them globals?

Also, why does the world switch code need a copy?

Paolo

