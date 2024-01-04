Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA9A24B22
	for <loongarch@lists.linux.dev>; Thu,  4 Jan 2024 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="W8+PrQCT"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7bb982d0f12so44429739f.0
        for <loongarch@lists.linux.dev>; Thu, 04 Jan 2024 07:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704383909; x=1704988709; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g+LkB4Vo+u25oWI7sGQO48sDZuLcvpPhc24u586CsWs=;
        b=W8+PrQCTOsJ0KUI4ZtsrxfiTQrZxQyWRt5vA34BZ+plGr2HJMfCMCCiofBTnUG+Jfy
         5FRA1Vv1tkjDPGuIwzSO0jimo2EkX23lecxp5RVT9h3DvuWc0KxeJ2wLPvV2/30Xu2nR
         7GcVsvdMtPDCwzmYWJUAMwrssNqk3HxQq3sAPUi6mHI/rqr7CkkYQyMjlIzxakLpI+Rr
         iEBXdhC8xO7yfnlOJSbl6qkMKcMo7f3qK91L4MI+okETVeM6Z7SyIHkvE4sBB5ZnTyF6
         sfa0l9S1dWNGJIVcrErTAg30IQerEcUVvN5TF6yMgktS+s9GMdoPsB+yyMXkcC2enSJh
         HU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704383909; x=1704988709;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+LkB4Vo+u25oWI7sGQO48sDZuLcvpPhc24u586CsWs=;
        b=tkTcnfg9S+Yq5khfsompMeDX0Z0zSNUgMOkGKmiY9gF1nPPVbGd3rEviLhv/lTaSY5
         9OpGJI1/DUybaveqwVZBLdUZvIU+1P88DKeJ5lp7Mu/azD+YnsjYkCeo3icnlBY8nxlZ
         Vp+XbEiGrojT5FcSozddHeDk44WAS5Al/fYzNUKOp+0ygc/X7OovQYLnIZ3NHURjRpG7
         cBUHqUP9BNRtyXpd37fFCrsAf6OzgR8x/+6EvH0dWb092gkG+ejUqp6buoym9SbHeCIA
         Oqo7Y3oFiIgwpeCk/hSujQLkOvXtB7ZXgap0m3zLN/tVzsCCzGYuOPA5QaK6x9QrsYDc
         6zZQ==
X-Gm-Message-State: AOJu0Ywa4pLYiCPZO/S7nMmUVsgtWt35KIdhuDwHzHWWKeQlxJFQfC80
	r/TLvW/6KhOm0WbpryXsdZQTpxSK79GfbA==
X-Google-Smtp-Source: AGHT+IH0j3oQCRY8sxvQe5xsZpHeGls13odOGuU65eTJqn0FYIyylaRiHWDyo9dxY5HyEPL4psyAAg==
X-Received: by 2002:a05:6e02:b48:b0:35f:f023:f8e2 with SMTP id f8-20020a056e020b4800b0035ff023f8e2mr508987ilu.17.1704383909345;
        Thu, 04 Jan 2024 07:58:29 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:b86c:e734:b34:45c6? ([2605:a601:adae:4500:b86c:e734:b34:45c6])
        by smtp.gmail.com with ESMTPSA id v16-20020a92d250000000b0035d6559c5b9sm9232707ilg.64.2024.01.04.07.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 07:58:29 -0800 (PST)
Message-ID: <84389bc3-f2e7-49c5-a820-de60ee00f8a7@sifive.com>
Date: Thu, 4 Jan 2024 09:58:28 -0600
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/14] LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 x86@kernel.org, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-arch@vger.kernel.org, WANG Xuerui <git@xen0n.name>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
 <20231228014220.3562640-8-samuel.holland@sifive.com>
 <CAAhV-H5TJPqRcgS6jywWDSNsCvd-PsVacgxgoiF-fJ00ZnS4uA@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAAhV-H5TJPqRcgS6jywWDSNsCvd-PsVacgxgoiF-fJ00ZnS4uA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Huacai,

On 2024-01-04 3:55 AM, Huacai Chen wrote:
> Hi, Samuel,
> 
> On Thu, Dec 28, 2023 at 9:42 AM Samuel Holland
> <samuel.holland@sifive.com> wrote:
>>
>> LoongArch already provides kernel_fpu_begin() and kernel_fpu_end() in
>> asm/fpu.h, so it only needs to add kernel_fpu_available() and export
>> the CFLAGS adjustments.
>>
>> Acked-by: WANG Xuerui <git@xen0n.name>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>>
>> (no changes since v1)
>>
>>  arch/loongarch/Kconfig           | 1 +
>>  arch/loongarch/Makefile          | 5 ++++-
>>  arch/loongarch/include/asm/fpu.h | 1 +
>>  3 files changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
>> index ee123820a476..65d4475565b8 100644
>> --- a/arch/loongarch/Kconfig
>> +++ b/arch/loongarch/Kconfig
>> @@ -15,6 +15,7 @@ config LOONGARCH
>>         select ARCH_HAS_CPU_FINALIZE_INIT
>>         select ARCH_HAS_FORTIFY_SOURCE
>>         select ARCH_HAS_KCOV
>> +       select ARCH_HAS_KERNEL_FPU_SUPPORT if CPU_HAS_FPU
>>         select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
>>         select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>>         select ARCH_HAS_PTE_SPECIAL
>> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
>> index 4ba8d67ddb09..1afe28feaba5 100644
>> --- a/arch/loongarch/Makefile
>> +++ b/arch/loongarch/Makefile
>> @@ -25,6 +25,9 @@ endif
>>  32bit-emul             = elf32loongarch
>>  64bit-emul             = elf64loongarch
>>
>> +CC_FLAGS_FPU           := -mfpu=64
>> +CC_FLAGS_NO_FPU                := -msoft-float
> We will add LoongArch32 support later, maybe it should be -mfpu=32 in
> that case, and do other archs have the case that only support FP32?

Do you mean that LoongArch32 does not support double-precision FP in hardware?
At least both of the consumers in this series use double-precision, so my first
thought is that LoongArch32 could not select ARCH_HAS_KERNEL_FPU_SUPPORT.

Regards,
Samuel

