Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3CBECF
	for <loongarch@lists.linux.dev>; Wed,  6 Sep 2023 08:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693989961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HiO4dpO0VY1hu4txDNG3Nh8hvwZDWTPnz7X+5XzDdqw=;
	b=MuwlVwGgGNvnPy2R8lYKD4hDoPzp6nMD+Z2AL/79LbZUp8/a8W22Mjj7zbLBnina4ELtFl
	oPU07DdnqcfeUBCPfwgvcvTk4Xb2SHsxmJscj51xGUSiq9QXIrxsxariOFheabLtKfsXN4
	ONQxAjZAuHT6pOeG8bIlTHFwap/RZ2w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-voTGV6_kM3qx6aoBbYEsiA-1; Wed, 06 Sep 2023 04:45:58 -0400
X-MC-Unique: voTGV6_kM3qx6aoBbYEsiA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-31aea5cf0f5so1931165f8f.1
        for <loongarch@lists.linux.dev>; Wed, 06 Sep 2023 01:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693989957; x=1694594757;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HiO4dpO0VY1hu4txDNG3Nh8hvwZDWTPnz7X+5XzDdqw=;
        b=dA1U+HIdunlu/45IEEtPheDYxZJ8LwplXMPTjRJBVzq0dKtid6UlVYzjcp6VgokFER
         SaN17hMU4nMXnWm5rbzPJBNaLY3RgBTSQQRpUW54IwN/dP5DeMVepaaHRyl8aYULS1uu
         ZSq58YUwpCcc82piY5qLzNO7yB6rGDEUVnXnqcW6l2s3m6TVfdmYzFSXp3w6zUYpGd4s
         pbCceuxlh5+TrNgE61d84ku4RUq2oTwgS90AcHQWLJSXOB6v+Ti/4tpUhE/c0BnTeTc0
         SSZolnsbiPhBLt/nnAP+GGiWYW3uYdKUzHMmOqmFLet2SSVeXri92+Jb6PFPCjAzcs+f
         FSVA==
X-Gm-Message-State: AOJu0YxmD3Udc9wDT46lB9G6aDSL/rw5lhKVRgZwyyuVTourOtI6n66O
	j+LO3Fyxuq+vVQEA8MZZZfubaEzB4wky9uqQHnMgh4X+TKZQoKu9i/5eLbT2g0MW04L9047nwTx
	wC2qpICQr4NesKsjwiFa0
X-Received: by 2002:a5d:464a:0:b0:314:3a3d:5d1f with SMTP id j10-20020a5d464a000000b003143a3d5d1fmr1841540wrs.19.1693989957075;
        Wed, 06 Sep 2023 01:45:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQmR4iZGBEiYiY4s675XAQ+S5BoOwlY5W6/yYJfzgEBy039rqvKU8y1+dEwqdV6Ytm0AzESA==
X-Received: by 2002:a5d:464a:0:b0:314:3a3d:5d1f with SMTP id j10-20020a5d464a000000b003143a3d5d1fmr1841522wrs.19.1693989956711;
        Wed, 06 Sep 2023 01:45:56 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70c:6c00:92a4:6f8:ff7e:6853? (p200300cbc70c6c0092a406f8ff7e6853.dip0.t-ipconnect.de. [2003:cb:c70c:6c00:92a4:6f8:ff7e:6853])
        by smtp.gmail.com with ESMTPSA id m15-20020a056000180f00b003142ea7a661sm19636219wrh.21.2023.09.06.01.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 01:45:55 -0700 (PDT)
Message-ID: <f7ca2e61-825a-f6cb-09b0-3b12e2c308ac@redhat.com>
Date: Wed, 6 Sep 2023 10:45:54 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] LoongArch: add p?d_leaf() definitions
To: Hongchen Zhang <zhanghongchen@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Mike Rapoport IBM)" <rppt@kernel.org>,
 Feiyang Chen <chenfeiyang@loongson.cn>, Qi Zheng
 <zhengqi.arch@bytedance.com>, "Matthew Wilcox Oracle)"
 <willy@infradead.org>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, loongson-kernel@lists.loongnix.cn
References: <20230906084351.3533-1-zhanghongchen@loongson.cn>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230906084351.3533-1-zhanghongchen@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.09.23 10:43, Hongchen Zhang wrote:
> When I do LTP test, LTP test case ksm06 caused panic at
> 	break_ksm_pmd_entry
> 	  -> pmd_leaf (Huge page table but False)
> 	  -> pte_present (panic)
> 
> The reason is pmd_leaf is not defined, So like
> commit 501b81046701 ("mips: mm: add p?d_leaf() definitions")
> add p?d_leaf() definition for LoongArch.
> 
> v2: add Fixes: in commit message.

This belongs under the "---". I assume whoever picks that up can fix it up.

> 
> Fixes: 09cfefb7fa70 ("LoongArch: Add memory management")
> Signed-off-by: Hongchen Zhang <zhanghongchen@loongson.cn>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

We should CC stable. I assume whoever picks that up can fix it up.

-- 
Cheers,

David / dhildenb

