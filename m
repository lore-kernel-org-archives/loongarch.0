Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A3B60BBE
	for <loongarch@lists.linux.dev>; Thu, 11 Apr 2024 01:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712798877; cv=none; b=obXY3bNmkA+8ecmSyUrfdY5WeHfiGAthi2e56xrViBkhJXZVSVh81zvhGfLQgkyRZFw90CMfu7v6SbW+byMB8uDYJmNerzOJ3NurH8Z/upfOasBhRFjup1dCz6zti6s9Ag7grmTcRpo+R9TIogv3Tw9f8oI8FSzUTFzq9I/+MsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712798877; c=relaxed/simple;
	bh=zY1vBuYzXUVAUPu7RYDaF9UtFORvIFjy44r4Y5Ige4g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kFnO2xfY1GlwErcPHH5bjjPMAc4V8r5oPhYxf76DQIwJgvBfsY73xHKHU1SEklCGuz8RGPwhPMn6BtnDxsxcJ7ZcNwUojJkflmZP+x0A2TkCTJq2nssFtPKSUl3fe9TK2ogJva/FMIxKMdV6oFXkkikYLJNEc8pkDBHXtbMuH5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mz0rZOLX; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mz0rZOLX"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-22ecc103220so3815085fac.2
        for <loongarch@lists.linux.dev>; Wed, 10 Apr 2024 18:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712798875; x=1713403675; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zY1vBuYzXUVAUPu7RYDaF9UtFORvIFjy44r4Y5Ige4g=;
        b=mz0rZOLXPBeaK5YWcMP51LJhPAe1FwsFd2CX0nqHuU+/77Mt3skcRGn4EpRqyeSXy5
         iZoM+ZXWRK+xH7Hptj3YbjnC9CRARSxnh0ZSF2W7IJXiBbtMhlMyXrae6XA9zSl9eFh8
         vhPiRbTh/fphhemFLvFjXy6IEWfrNNznYjUwmPIHcytyCGUE5mBs13qcEnAQu9QmZXni
         C7cQi3e0BI0hZEQvsGN+OVEPaV8NoB20At21oFrrwiYy7Qmr7TmnwNctCyNczGoXvbLv
         o7oyZkZnGl+ptCx1d0B6VLZ8aC7Ru4sxs5puO+AAumgkN14tRdTiP2IJGgBP7Drj7T0a
         6NXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712798875; x=1713403675;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zY1vBuYzXUVAUPu7RYDaF9UtFORvIFjy44r4Y5Ige4g=;
        b=kEg34fm8AlamlcoZ1E16GB+xlDxVPnjKoNt7rukC8BQGRS5RxO02cDihNNC6AYqK6T
         u8fjoi1tJa+1KeITHVOnWQD55TgO5nTN01VsiULWoWhi1vrsx8/A5cwEQeIY3AR+j8lI
         bWMRCcpoXy0EJ+TnCWbXFh1nj6JnV54tXcRVdU0coWaM+JqEHzxgwtpR819icO5hPayn
         7Kc5rm2BfhPDBN6p9qIaYvKgGKfpDbVMU02OLm37fU7yIjMK53EDIz84kOc/5Z4nC7F4
         A7SybPRm7Umxbemk8kaeUCSwRMWh1FkBVW3t1nbzO/q/gwTEze1DRHDoIwK8bcnjySuB
         Vqjg==
X-Forwarded-Encrypted: i=1; AJvYcCVBeI5bwJpDjuGsjcG8bHmOaJU6G0kEtxZS1HVM6hDRG0qvuqcvrVnDkhOGYF0G8gAfw8dAvXlZ14Vmcw3RnZgjD+Y4SEOdiCf/
X-Gm-Message-State: AOJu0YzlbRoqYBo7pdnSJOdjrp55Cskynh/MEq8x6D+NcFMwf3oZOCH5
	zOens/LLmHNk3//obVedkpYTvPYm3LYfQK4LaqSmMo4DjkgQ+u4/GU4eEwTxgQQ=
X-Google-Smtp-Source: AGHT+IF8lPPFTalL1WPSfnBvduuYhf5K6F9EIeC9RLCCka0Vl/mHkW4wRauCXJubFXwb7faJCr3ffA==
X-Received: by 2002:a05:6870:518:b0:22e:bcfd:deb0 with SMTP id j24-20020a056870051800b0022ebcfddeb0mr4667832oao.41.1712798874921;
        Wed, 10 Apr 2024 18:27:54 -0700 (PDT)
Received: from localhost ([2804:14d:7e39:8470:fcac:9b42:fe81:c62f])
        by smtp.gmail.com with ESMTPSA id c1-20020aa78c01000000b006ed38291aebsm289791pfd.178.2024.04.10.18.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 18:27:54 -0700 (PDT)
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
  linux-arm-kernel@lists.infradead.org,  x86@kernel.org,
  linux-kernel@vger.kernel.org,  linux-arch@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org,  linux-riscv@lists.infradead.org,
  Christoph Hellwig <hch@lst.de>,  loongarch@lists.linux.dev,
  amd-gfx@lists.freedesktop.org,  Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
In-Reply-To: <4c8e63d6-ba33-47fe-8150-59eba8babf2d@sifive.com> (Samuel
	Holland's message of "Wed, 10 Apr 2024 20:11:04 -0500")
References: <20240329072441.591471-1-samuel.holland@sifive.com>
	<20240329072441.591471-14-samuel.holland@sifive.com>
	<87wmp4oo3y.fsf@linaro.org>
	<75a37a4b-f516-40a3-b6b5-4aa1636f9b60@sifive.com>
	<87wmp4ogoe.fsf@linaro.org>
	<4c8e63d6-ba33-47fe-8150-59eba8babf2d@sifive.com>
User-Agent: mu4e 1.12.2; emacs 29.3
Date: Wed, 10 Apr 2024 22:27:52 -0300
Message-ID: <87le5kofhj.fsf@linaro.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


Hello Samuel,

Samuel Holland <samuel.holland@sifive.com> writes:

> On 2024-04-10 8:02 PM, Thiago Jung Bauermann wrote:
>> Samuel Holland <samuel.holland@sifive.com> writes:
>>> On 2024-04-10 5:21 PM, Thiago Jung Bauermann wrote:
>>>>
>>>> Unfortunately this patch causes build failures on arm with allyesconfig
>>>> and allmodconfig. Tested with next-20240410.
>>
>> <snip>
>>
>>> In both cases, the issue is that the toolchain requires runtime support to
>>> convert between `unsigned long long` and `double`, even when hardware FP is
>>> enabled. There was some past discussion about GCC inlining some of these
>>> conversions[1], but that did not get implemented.
>>
>> Thank you for the explanation and the bugzilla reference. I added a
>> comment there mentioning that the problem came up again with this patch
>> series.
>>
>>> The short-term fix would be to drop the `select ARCH_HAS_KERNEL_FPU_SUPPORT` for
>>> 32-bit arm until we can provide these runtime library functions.
>>
>> Does this mean that patch 2 in this series:
>>
>> [PATCH v4 02/15] ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
>>
>> will be dropped?
>
> No, because later patches in the series (3, 6) depend on the definition of
> CC_FLAGS_FPU from that patch. I will need to send a fixup patch unless I can
> find a GPL-2 compatible implementation of the runtime library functions.

Ok, thank you for clarifying.

Andrew Pinski just responded on the GCC bugzilla and if I understood his
point correctly, it seems to be a matter of changing function names to
what GCC (or actually the arm EABI) expects...

--
Thiago
