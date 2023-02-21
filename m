Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD2C1381
	for <loongarch@lists.linux.dev>; Tue, 21 Feb 2023 08:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676967254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CMD/lSpj8Q+BWiNprToa/ipg9NB2qcmu1EFE9cZ2W3g=;
	b=B9dAcKauPhgRy0UtscRJccn7nkXfD1lNGw67rheO6oIuRkoGnXL23vejX4wpvK2Ncecvjg
	MEFfS1AS940CDlgzpAe+irrjhc44d06XeGRN4OH60phCTrHyJqyukNLYGbUItoBeqDzDRL
	WmlnP/2pxO+YvYEGWcPgvLaxUdYsskQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-673-vecH4kEGNbKuv_Rc3Hdk8g-1; Tue, 21 Feb 2023 03:14:13 -0500
X-MC-Unique: vecH4kEGNbKuv_Rc3Hdk8g-1
Received: by mail-ed1-f72.google.com with SMTP id dm14-20020a05640222ce00b0046790cd9082so5233791edb.21
        for <loongarch@lists.linux.dev>; Tue, 21 Feb 2023 00:14:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CMD/lSpj8Q+BWiNprToa/ipg9NB2qcmu1EFE9cZ2W3g=;
        b=TWzoa8LHpHwZPtExnRJ/bBjqmjzQnHJFK9RJbz76ADMAW8XnKXB3Bvm6ZWinmDEdr+
         YC2+OrpsQkgw9HzUw6BUIRKys/26aFgIqyEIGYEGWv1YxP+W7eBvK864eBeYMucbwz11
         emKZciQheP6FuxBJ1D8ko4A0SYqpZiAMWqZKeljs1fWTfwn2EdHpdelR4fuP4y6kdSJ4
         Cp+j1HmzqXUfDMjdRC0Ifyo+YtPfAFoSb06KAGSXakY8lofc2VigZk/YgzXqfxTj1g0H
         4IbtD9bNSBHcRR2tZADZnulJ95h1kDXuWmSKKoHxKZPFL1BArynN6lSZgtP4IqVgSQL/
         yZoQ==
X-Gm-Message-State: AO0yUKU9TOGT8PTmi8wTsYSdcBhkzTxM97WD91iM7lyRs6HaNHKRl2ZR
	4jfOihEwk1QMEFYVkM+0GgPsgSFpUz0tjgEI+Xv4U+RNlz6B8XiF29wD78Ev6kejoFzngI0MCAT
	St0sLyUf6Kc4KjrvraTDq
X-Received: by 2002:a17:907:2cc5:b0:8ae:e724:ea15 with SMTP id hg5-20020a1709072cc500b008aee724ea15mr14369743ejc.76.1676967252332;
        Tue, 21 Feb 2023 00:14:12 -0800 (PST)
X-Google-Smtp-Source: AK7set9AS5QbQlqtrVyvZDghkkGcXTp+zHcc9xFk+Kvirqcn35qFg8g54l0y9vHodt2+vSxdFaPeOQ==
X-Received: by 2002:a17:907:2cc5:b0:8ae:e724:ea15 with SMTP id hg5-20020a1709072cc500b008aee724ea15mr14369720ejc.76.1676967252017;
        Tue, 21 Feb 2023 00:14:12 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045? ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
        by smtp.googlemail.com with ESMTPSA id lf13-20020a170906ae4d00b008b12c318622sm6855117ejb.29.2023.02.21.00.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 00:14:11 -0800 (PST)
Message-ID: <3f16a8e1-21d9-808e-aa1a-4f1d6f6f291b@redhat.com>
Date: Tue, 21 Feb 2023 09:14:06 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: maobibo <maobibo@loongson.cn>, Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Oliver Upton <oliver.upton@linux.dev>
References: <20230220065735.1282809-1-zhaotianrui@loongson.cn>
 <20230220065735.1282809-3-zhaotianrui@loongson.cn>
 <bf4111f9-f722-1847-4f1d-964c5356f392@redhat.com>
 <0fa9c062-d3fc-61e5-4d54-6bc29f7c64cf@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 02/29] LoongArch: KVM: Implement kvm module related
 interface
In-Reply-To: <0fa9c062-d3fc-61e5-4d54-6bc29f7c64cf@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/21/23 07:59, maobibo wrote:
>> Also, why does the world switch code need a copy?
> There will be problem in world switch code if there is page fault reenter,
> since pgd register is shared between root kernel and kvm hypervisor.
> World switch entry need be unmapped area, cannot be tlb mapped area.

So if I understand correctly the processor is in direct address 
translation mode until the "csrwr t0, LOONGARCH_CSR_CRMD" instruction. 
Where does it leave paged mode?

Can you please also add comments to kvm_vector_entry explaining the 
processor state after a VZ exception entry (interrupts, paging, ...)?

Paolo

