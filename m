Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F80F23C38C
	for <loongarch@lists.linux.dev>; Wed,  6 Aug 2025 13:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754488214; cv=none; b=d78Epj2cQeeeT66M+nsuou2Mow4Od0RCaBKJQaDU2je0UNwT0yU57HrUAqXlPCjPluh4pXQw22ll+QbyxqH27KZmtuJXbBGp1UzAhyWj+yhwucuU/q5lA2h0Lo1XKYibJAOIBfEwEI4tFW+/5j9UcfNeRGha5MKVw/KfsybVGJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754488214; c=relaxed/simple;
	bh=fmtML73QEJXgiK3rh+aTu+GvdCinOztitSZFO4XClmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XQiUT9nfhQBP3vEfqiCpcB1CegINNadPXNEmSLR2mCVTsbWqpmMMDN/a4UvC15npo2zNvJLR7olyxZl0Q9PatxXhm5Lx10DQWmt9UsUWHA9WqFvM+vtHyAcdCjRTvVPrqEirokHQDNhsvZAZfCoSD4nFwssWfi7aVPv1UCrC5HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ENRuQStZ; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ENRuQStZ"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-332341d99dbso11550031fa.3
        for <loongarch@lists.linux.dev>; Wed, 06 Aug 2025 06:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754488210; x=1755093010; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pDOCIZR6gSwH1CTXkpwwYCK6HLPl+F0ICSkVzqPXsh0=;
        b=ENRuQStZeCIG4XI9dE6c8z9kvscPZTK4NtFCbjQJUmJGD79Sw61OEV19Qde9OduQ2t
         y0chYLJM4w6f5DS0naer4oz0ogekSFhJV/VrRCcQ8qoCBdGvbFkN5FqUGCGP13uOaRDM
         mrVcRHVs2VY073wianJv4KY3/M6TF3v+4BlkUt1e83CsGRzxvht5CARFBl3Iy7zcWG1v
         TvsflAUI4w/AwT9pPR/8bRMyQ7Y6jhhOcBYr7HYwTyHIkiEPf7tTMYyzzwv+6Z35zfJ0
         zk3FEdC0uk2ceDWLwIV4begxtVCdXU2JNbjz8j0ezAuEuWIQDEePQ9DRMC+D6a6K4kMt
         B3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754488210; x=1755093010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pDOCIZR6gSwH1CTXkpwwYCK6HLPl+F0ICSkVzqPXsh0=;
        b=ZMjf0LriqlLSbNvAZN7l0cOVuan3hXL9LfAngHOBbGEio8+vTqy6UxtGFfscz5Ggqh
         PRKOT30ZNATRjjne3HZcmYE9wNbII9FQc8B6hT8YLozUJctgiU/9WSm9sCJbF1nl2nk5
         PYudz+mkM4tsViMzIjzIUeBpWzNEhy37QljZFv+EqkbQuIOQ+Ufx9oTGiVDI/sX6bvNO
         MPwGerxe7oKVDLvj5q2+n/ND9/Ks7vWO50K8CMa+iaReTvnV61OA7u78hbd4HM7maDZZ
         z5VTxBOKKWDMs/f0XOvXnS3eDkc5oZi07Wansh8g3ZjIjYYUCJP1tE0cLX/YBgd2TbC7
         srSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9y1NJW8WRgi9EsnoNdzh0iIoHG59HVoC7J7bM/LGTaXZKpDVT73y1j664zedI0DXtRgwckPuIgy4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMzQ3xk+xXPVW93BrT5VEvIBNrRbE9xXz0z9RYC+dKkJKzdvw+
	zrMyEH3b1/yAT/e31+8NDBPymbc6ndJvQyE/4lVAzP6cNFJuRA1GKQPG
X-Gm-Gg: ASbGncvfQGIW0Ieodm/1NeiKO1rKqHREbWT+F+pmtHjjT2vAyREgPnG5bNxwarzxd44
	+AGKSf0JOCK6jtRvyAfSkLZHXtaqcwdSg7IyTeU09UrqE6gbzo/qp7VgTU0IoduDciM+zguvtgr
	asr0Wc/jmM95SDKIBcHBdIgxBVqSWmSKobWT0qkHDRk/Yw8D2e+4LOvbdAtQRkUz+SoqSgiXKYi
	i7SlPhtfpk/o2R9GPzRIPv+h3rlRI0uKrccWaKXs6j7EPqlJIMJLfnIrYLue5ZVSit5YcnE2tj4
	Fze8ephHwxfDZQid0MOCy4h1P26ngTUmIrGDat73+ytGvsgpKDzAnNggPVUi7BZT4Pxd+NUA8JI
	oI03BVClXi2DRUGuINnKfOtVFbN44ABxq0HVRErFWS4ZVWVwHhA==
X-Google-Smtp-Source: AGHT+IEsyaC4e5C8bAXA34DF26BCI2kUm+pbeFPiYngQRQqOaMh9b3JgYLiHo/Ul9EDDlBD4plM96A==
X-Received: by 2002:a05:6512:3b1f:b0:550:ecdf:a7f9 with SMTP id 2adb3069b0e04-55caf35fc1amr414988e87.10.1754488210277;
        Wed, 06 Aug 2025 06:50:10 -0700 (PDT)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88cabbd8sm2356761e87.149.2025.08.06.06.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 06:50:09 -0700 (PDT)
Message-ID: <ece4aab9-a195-47c9-b370-c84f5dcc0098@gmail.com>
Date: Wed, 6 Aug 2025 15:49:22 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] kasan/um: select ARCH_DEFER_KASAN and call
 kasan_init_generic
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com,
 agordeev@linux.ibm.com, akpm@linux-foundation.org, zhangqing@loongson.cn,
 chenhuacai@loongson.cn, trishalfonso@google.com, davidgow@google.com,
 glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250805142622.560992-1-snovitoll@gmail.com>
 <20250805142622.560992-7-snovitoll@gmail.com>
 <60895f3d-abe2-4fc3-afc3-176a188f06d4@gmail.com>
 <CACzwLxhs+Rt9-q6tKi3Kvu7HpZ2VgZAc4XEXZ4MEB60UbFjDKg@mail.gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <CACzwLxhs+Rt9-q6tKi3Kvu7HpZ2VgZAc4XEXZ4MEB60UbFjDKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/6/25 6:35 AM, Sabyrzhan Tasbolatov wrote:
> On Tue, Aug 5, 2025 at 10:19 PM Andrey Ryabinin <ryabinin.a.a@gmail.com> wrote:
>>
>>
>>
>> On 8/5/25 4:26 PM, Sabyrzhan Tasbolatov wrote:
>>>
>>> diff --git a/arch/um/Kconfig b/arch/um/Kconfig
>>> index 9083bfdb773..8d14c8fc2cd 100644
>>> --- a/arch/um/Kconfig
>>> +++ b/arch/um/Kconfig
>>> @@ -5,6 +5,7 @@ menu "UML-specific options"
>>>  config UML
>>>       bool
>>>       default y
>>> +     select ARCH_DEFER_KASAN
>>
>> select ARCH_DEFER_KASAN if STATIC_LINK
> 
> As pointed out in commit 5b301409e8bc("UML: add support for KASAN
> under x86_64"),
> 
> : Also note that, while UML supports both KASAN in inline mode
> (CONFIG_KASAN_INLINE)
> : and static linking (CONFIG_STATIC_LINK), it does not support both at
> the same time.
> 
> I've tested that for UML,
> ARCH_DEFER_KASAN works if STATIC_LINK && KASAN_OUTLINE
> ARCH_DEFER_KASAN works if KASAN_INLINE && !STATIC_LINK
> 
> ARCH_DEFER_KASAN if STATIC_LINK, and KASAN_INLINE=y by default from defconfig
> crashes with SEGFAULT here (I didn't understand what it is, I think
> the main() constructors
> is not prepared in UML):
> 
>  ► 0       0x609d6f87 strlen+43
>    1       0x60a20db0 _dl_new_object+48
>    2       0x60a24627 _dl_non_dynamic_init+103
>    3       0x60a25f9a __libc_init_first+42
>    4       0x609eb6b2 __libc_start_main_impl+2434
>    5       0x6004a025 _start+37
> 

No surprise here, kasan_arch_is_ready() or ARCH_DEFER_KASAN doesn't work with KASAN_INLINE=y
This configuration combination (STATIC_LINK + KASAN_INLINE) wasn't possible before:

#ifndef kasan_arch_is_ready
static inline bool kasan_arch_is_ready(void)   { return true; }
#elif !defined(CONFIG_KASAN_GENERIC) || !defined(CONFIG_KASAN_OUTLINE)
#error kasan_arch_is_ready only works in KASAN generic outline mode!
#endif



> Since this is the case only for UML, AFAIU, I don't think we want to change
> conditions in lib/Kconfig.kasan. Shall I leave UML Kconfig as it is? e.g.
> 
> select ARCH_DEFER_KASAN
> 

No, this should have if STATIC_LINK

