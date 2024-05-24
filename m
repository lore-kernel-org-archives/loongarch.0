Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C09B85C6C
	for <loongarch@lists.linux.dev>; Fri, 24 May 2024 13:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716558205; cv=none; b=WsZEfCxmOQaJtMXcYx67u6nlxs/4rMSY4cR5OioR4xy2JXk06B7SSDBB8iDW4EgkuH97xADH7n4yevVSemO/kEx7D4/epkZReZHEkxUN1rzbUpmemi6AoM5GUxA4Qlw3roxcIYB6OW1HhpJSY139VpboygkN3YIeT60vgOw5K7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716558205; c=relaxed/simple;
	bh=4fg+g+15lUvITv1DL7MxCA+mRiWs9ZIVv1H2yv35hJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nwaF0CpQi7QdNvvUIs5/LGmMBDg7+3Ey9YUD5UxQnXtpo/77euzx2XSzq0hsBP7v0lrSs6sMPgBsplnrx1hWwSeSoqnT/pjhR0MOOR8/pr+3NxjqY/ZNtqIW0h/ZwxdPwRZs/ton5hEOXGchiklgBWwzhgezsSsa20byYUxZJI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLbN58sF; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLbN58sF"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-681a4422f49so647380a12.2
        for <loongarch@lists.linux.dev>; Fri, 24 May 2024 06:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716558203; x=1717163003; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0yupO8dUYCF+0G9tTYKlxkVq1DaGE31KehgEMMUSJG4=;
        b=GLbN58sFVlzkyCYNp/rFXaCV3UK2oI7fGaD40Tgm32gt88xKfIptgE2g3BTOIl0EZu
         Nyoqv5UKOfDjTdnOWXNPxdZIZQWKDQ0l5tZTHniVgdmXw3ru23mg9+niynVWl/h8BIi3
         6v/d6tkjKlSADRm7FFtyGCBeAXjUVjWLj3NAP9YVCox7elcpCBFU7Cs9CeggGdiGacwE
         Wl0PuwyeSqi9kGQqmsGG6y65bJSOWIRtHKd03MlSlWqjaexW0qp5GwFvfBgGGJXa5dHr
         6ngZqc9KV9lO2RH39ydEo2r/eEDJbJjB9UJFQn9L4H2COEHfJ2xqwWYdXZoBQdlQmvts
         prog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716558203; x=1717163003;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yupO8dUYCF+0G9tTYKlxkVq1DaGE31KehgEMMUSJG4=;
        b=gwVfRUzkojz9iiBbHhDWHew1S1ScntgDslbYdgChbQgQKn08bqUsN4MdXFMz7JiT3V
         TQD41uD2AhJ/swEaoTX9aVcUIZM40HZ8fFwDTrmkJRZfsWhUE//EsWeTrCyHyS+shIGG
         h6XwqgFUnaxBEBIj+34pTuh+SyJ9UHhklTixuJS4bZnrZsPjO0ILft8n45gsa+T5EnWe
         mVUq5ehtFbKrm9A3KDm7KKdGdJkF0a0VVOW0R7O41PLVjijHUz/KaTp8F3ClMap6VfsV
         CPdYdQwNb4kw7MWQT/q7ApYGdPvTgYaekOfJtsaeegP70soKZ3WCU8C+MDlHsg6esX86
         HSKg==
X-Forwarded-Encrypted: i=1; AJvYcCVZJTB/bGIOAdRBaX2Fy7+/XZxspPlQCj4ZdzAy/+eUskk0NAbLFZFZ8LfSPlbR5sX/Dol80a0wy5eKb494BmeH/SnlBVaV8Wzw
X-Gm-Message-State: AOJu0Ywj7FU3mpVCy6tIt2F2+/0E10D9vngLAsGL6jadGPv93mLX4q0q
	U8hgeBmpOL4b5M8+K0sF/0hrKqR8ZBuOcWexSWG/VSK5lCvqJmMn
X-Google-Smtp-Source: AGHT+IFP+60RswKtT3v6VqYC0kcSrnoN8GHpqIEwAiQOpkJYbmvZ32zTc+S4LaqCEySlMq+zyLYErA==
X-Received: by 2002:a17:90a:43c5:b0:2be:b2:c7fa with SMTP id 98e67ed59e1d1-2bf5e94444cmr2298605a91.6.1716558203317;
        Fri, 24 May 2024 06:43:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bdd9ef08b5sm3278876a91.14.2024.05.24.06.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 May 2024 06:43:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1e088782-418d-41e2-843f-b3d6cd3ab4f7@roeck-us.net>
Date: Fri, 24 May 2024 06:43:20 -0700
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
 <20240329072441.591471-14-samuel.holland@sifive.com>
 <eeffaec3-df63-4e55-ab7a-064a65c00efa@roeck-us.net>
 <CADnq5_NmKyTBbE6=V+XdEKStnjcyYSHyHqdkgBen4UhPnVKimQ@mail.gmail.com>
 <CADnq5_Ndzw5Gre=yyPKyFNX5yFWjTCMg2xqrn6tEj6h8t-nAYg@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CADnq5_Ndzw5Gre=yyPKyFNX5yFWjTCMg2xqrn6tEj6h8t-nAYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/24/24 06:18, Alex Deucher wrote:
> On Fri, May 24, 2024 at 9:17 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>>
>> On Fri, May 24, 2024 at 5:16 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> Hi,
>>>
>>> On Fri, Mar 29, 2024 at 12:18:28AM -0700, Samuel Holland wrote:
>>>> Now that all previously-supported architectures select
>>>> ARCH_HAS_KERNEL_FPU_SUPPORT, this code can depend on that symbol instead
>>>> of the existing list of architectures. It can also take advantage of the
>>>> common kernel-mode FPU API and method of adjusting CFLAGS.
>>>>
>>>> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>>>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>>>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>>>
>>> With this patch in the mainline kernel, I get the following build error
>>> when trying to build powerpc:ppc32_allmodconfig.
>>>
>>> powerpc64-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
>>> powerpc64-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
>>>
>>> [ repeated many times ]
>>>
>>> The problem is no longer seen after reverting this patch.
>>
>> Should be fixed with this patch:
>> https://gitlab.freedesktop.org/agd5f/linux/-/commit/5f56be33f33dd1d50b9433f842c879a20dc00f5b
>> Will pull it into my -fixes branch.
>>
> 
> Nevermind, this is something else.
> 

Yes, CONFIG_DRM_AMD_DC_FP is enabled in that configuration.

Guenter

