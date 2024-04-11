Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B4A604DD
	for <loongarch@lists.linux.dev>; Thu, 11 Apr 2024 01:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712797869; cv=none; b=k0vnw+GPW763K7ivKvANG+ukDgua2ZROMHCy2OaDRs2JCJ8GiRT0ybZSOVlQM1CzR8E2tetUWFnEZLmERwbGpUtBERGSKR/pQv8IS+RZhIjpAU/wV5N/j/kurLDx0Pb40AY0BkoLcSBV40tr+PDE+3lqRGJ1zjTohlkcOc4HGvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712797869; c=relaxed/simple;
	bh=9YyH9BgEo3s56+nSbcPZpFNHGs99BC+E0EcZLKOsSQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fGouS+G1D9waqcAqQ3q/YTCm9oK8wOgItxnuPhL1XeFXwZlzdDOwIsznEukHqvj5BJBAWnVzfzY2Nt1aMX6/uv4wkWnAxBHJdt24K8gfpC4dfmt+wRLbi+HxAzQnRKxLSGEvSxsRL2Lsk/i5DoNQrx9NoTQUiSfNSAThmvPW6/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=AxeOZmzO; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="AxeOZmzO"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5aa27dba8a1so2546663eaf.0
        for <loongarch@lists.linux.dev>; Wed, 10 Apr 2024 18:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712797866; x=1713402666; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K7z1/Srv4eZ2vooDSDvwwBej5oDKDz5itKY0SDj8VoQ=;
        b=AxeOZmzOeiBzUg8svg270mxhH8c9jEeHK1QdGyghWgWBIpfdhpH+yoArqeYsct6TqD
         6LzIvLAR3d0xYmqlOFc/TyqwTIMebmlXtM+CK2W/mHNnP+c4fnQ65BPabZqg9AYrEsdC
         hAAS/xijw9CvPFNRlCa6S2/ntzmhNCoeCy+KPNY1ScIPSc4yvHXf38+yH15+hMimylXQ
         haZVwE1VS8fHBGvSy4Gj5VXaO894cPErDz3nmUBOKHAF4H+iov+238oXXMiZtmIX+gz3
         zVTafv9oOBufUs7PumrsqWzB+oxxD7JwzdI5WJS+NfxMs+pNs5PLAlrGg8kiILIZJp3m
         kJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712797866; x=1713402666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7z1/Srv4eZ2vooDSDvwwBej5oDKDz5itKY0SDj8VoQ=;
        b=q9sYhyrLoIVDmqjzH65eraeeJVeFWB8z/gxiJdRjmg0ssOzKAvTv9U4dg67Jtv/SFB
         U8xWR3F/AOJA7RrDFcVrJOX1hD7TENg5TYdEf/LpDEYeDSqSdyzvqfAkR/3qCnTJNVvG
         iUwLg/Y/Rp3YwBRIibIo4reNm3ju4WYmXDfV0GDggmxUiVg4aNpTzbYISmoXLJxxY6q0
         XPpJD3ZY0bKjq6G+h7TXd9RwJjR0Qs+AFZDvcScO9mW7j0B0exG+ui7G6Nv50owEgngV
         AaLoG7p7HgPGtPro9TejhathxGMjOeXI1opRnht157xLDjUA0DqSnsl209GYyFJt0PPr
         VJ3w==
X-Forwarded-Encrypted: i=1; AJvYcCUCvzdlCpXQzHK4Cc2BOro2dWkpWR+1h+MO+yOSGXEMLuPfMTiwNbtgzUnPAywQPwho6nTDTvlVL/m9DPyzTqAsuDN4l07AfqtC
X-Gm-Message-State: AOJu0YxVODBUxoNuOHqH2I2DgvMF34mME3/+dMm9Xi1H1X/gzoEF57J3
	jqko2TPH1R/l0TQ27ZYF091Qx21vMi6vqrS8gHycA8VlFVxUUwxPtMo/Vv0+s7U=
X-Google-Smtp-Source: AGHT+IFvdAWGolMk2tEZ8bM2BAlC1TsYZtb/fNUYXyTQY+hWEfuiEC430lr0paNhGs3so4u/3MehIA==
X-Received: by 2002:a4a:e9f3:0:b0:5aa:6a28:27ea with SMTP id w19-20020a4ae9f3000000b005aa6a2827eamr3725829ooc.6.1712797866523;
        Wed, 10 Apr 2024 18:11:06 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.8.167])
        by smtp.gmail.com with ESMTPSA id db1-20020a056820270100b005a4bc907f0asm113158oob.15.2024.04.10.18.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 18:11:06 -0700 (PDT)
Message-ID: <4c8e63d6-ba33-47fe-8150-59eba8babf2d@sifive.com>
Date: Wed, 10 Apr 2024 20:11:04 -0500
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
To: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
 <20240329072441.591471-14-samuel.holland@sifive.com>
 <87wmp4oo3y.fsf@linaro.org> <75a37a4b-f516-40a3-b6b5-4aa1636f9b60@sifive.com>
 <87wmp4ogoe.fsf@linaro.org>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <87wmp4ogoe.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Thiago,

On 2024-04-10 8:02 PM, Thiago Jung Bauermann wrote:
> Samuel Holland <samuel.holland@sifive.com> writes:
>> On 2024-04-10 5:21 PM, Thiago Jung Bauermann wrote:
>>>
>>> Unfortunately this patch causes build failures on arm with allyesconfig
>>> and allmodconfig. Tested with next-20240410.
> 
> <snip>
> 
>> In both cases, the issue is that the toolchain requires runtime support to
>> convert between `unsigned long long` and `double`, even when hardware FP is
>> enabled. There was some past discussion about GCC inlining some of these
>> conversions[1], but that did not get implemented.
> 
> Thank you for the explanation and the bugzilla reference. I added a
> comment there mentioning that the problem came up again with this patch
> series.
> 
>> The short-term fix would be to drop the `select ARCH_HAS_KERNEL_FPU_SUPPORT` for
>> 32-bit arm until we can provide these runtime library functions.
> 
> Does this mean that patch 2 in this series:
> 
> [PATCH v4 02/15] ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
> 
> will be dropped?

No, because later patches in the series (3, 6) depend on the definition of
CC_FLAGS_FPU from that patch. I will need to send a fixup patch unless I can
find a GPL-2 compatible implementation of the runtime library functions.

Regards,
Samuel

