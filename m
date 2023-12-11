Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EEE4C60B
	for <loongarch@lists.linux.dev>; Mon, 11 Dec 2023 16:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Cb0F83Dh"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-67abd1879c0so30673436d6.2
        for <loongarch@lists.linux.dev>; Mon, 11 Dec 2023 08:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702311375; x=1702916175; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9O17D9j4YT4XtoaSYd3/nhs4s1HCIt9uZx1EA+AxCks=;
        b=Cb0F83DhtBw+5yg3WJdQkNsWTIkkzEsj9lJt9Kd2eCeaJQgzyL6JjUMsoi4s/sAWPK
         2cUQ9GmcYDyCleYYBsUGhDJEtkKBX7BkzOvGJiVUm714T+HBWL4gLA/PUZHzwBkJrlII
         dpc8wiD3gCXkYvCpClnaAHm1Tw0g6WNfku0p6CJ3IG5RVqLh2rQBZKWQVZcOjU+jfviN
         nnCwXv73qyAQIKYDOuWLF9m56Wou9+typmdmJfdqntmB/cmGzUez61W0svTfcNkbOC+W
         pataZvbA4D20LCIrmJypfHyWyq3RDn0uv8hGedZZ14hvQNwfZF0+taBi+U3jHWSlKGa2
         5MRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311375; x=1702916175;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9O17D9j4YT4XtoaSYd3/nhs4s1HCIt9uZx1EA+AxCks=;
        b=YcLCucpuegbjizzSJxjMPVqyZumf4B28zo5UVaNtLDds4pIEdLK3iWMpC4w/btsMAU
         0n+UinaOykutueFTl7Y43L0vYfXOzsoabfv6Ht+6kgtGZ8mZKnDWqaarxZBeXqRPqyW0
         vAliX9kj8h/OZqvimql/WzeuTqxOlVeSZkrZ0xh/xImXSzs/VjobbOdRWv4FgAS5s1lW
         T11SJ2/Tsek7Z4tpPFeXf7ixBnuuHWJeBWKtrI/X58fmLg0XVzoSETDYax1ZNOT5PALI
         BWgBgK4+6KlQZPovIGjVcMGM/M5IV/JU2vuPOpZmNyQMmqoJhGusIoeOu4xrmP16TIXf
         2Eqw==
X-Gm-Message-State: AOJu0YzluzC/RlP4sZvHvuK7CgtGWLg2DhPhJHvzpz3ibwA6zD2nn1QJ
	xo7KmJxRrhVHgItUjxID9jSq3w==
X-Google-Smtp-Source: AGHT+IHy4FKXKcoa5vr1zWRR7h8ldItNotN+bq27os2Gmy1WmTZV3fGNzyOi2gfObdJOXzxcGBLOzA==
X-Received: by 2002:a05:6214:1fd9:b0:67e:b878:8e48 with SMTP id jh25-20020a0562141fd900b0067eb8788e48mr4904522qvb.39.1702311375258;
        Mon, 11 Dec 2023 08:16:15 -0800 (PST)
Received: from ?IPV6:2600:1700:2000:b002:f8a3:26ec:ac85:392e? ([2600:1700:2000:b002:f8a3:26ec:ac85:392e])
        by smtp.gmail.com with ESMTPSA id d17-20020a0cf6d1000000b0067a18167533sm3380983qvo.83.2023.12.11.08.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 08:16:15 -0800 (PST)
Message-ID: <3f28c1f7-f29c-461f-a90e-58d8e0996cc0@sifive.com>
Date: Mon, 11 Dec 2023 10:16:14 -0600
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/12] riscv: Add support for kernel-mode FPU
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arch@vger.kernel.org
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
 <20231208055501.2916202-10-samuel.holland@sifive.com>
 <ZXc0rAdi7Vo8nbS8@infradead.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <ZXc0rAdi7Vo8nbS8@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2023-12-11 10:11 AM, Christoph Hellwig wrote:
>> +#ifdef __riscv_f
>> +
>> +#define kernel_fpu_begin() \
>> +	static_assert(false, "floating-point code must use a separate translation unit")
>> +#define kernel_fpu_end() kernel_fpu_begin()
>> +
>> +#else
>> +
>> +void kernel_fpu_begin(void);
>> +void kernel_fpu_end(void);
>> +
>> +#endif
> 
> I'll assume this is related to trick that places code in a separate
> translation unit, but I fail to understand it.  Can you add a comment
> explaining it?

Yes, I can add a comment. Here, __riscv_f refers to RISC-V's F extension for
single-precision floating point, which is enabled by CC_FLAGS_FPU.

