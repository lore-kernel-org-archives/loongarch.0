Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F875B1E7
	for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 18:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711735381; cv=none; b=gHVrYp84BRmEjobq+6A/G28arWQYEewnSEpx73SVuRs151om03gK0Aqooj0s5HSKfHfK8IiHUA9uBMF4vlhXezPbTO1RhNVd5QCRLs8tPqBNF0EzIm9+np5pkSi2IBbJJwHQuLsycAwqPpbt8BPZV5gHUy0RGMO5twUUhPawBlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711735381; c=relaxed/simple;
	bh=+S3hlEF4bZldPHqmLCThWpT6aoGahvI+J6fFNIlvYoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RpTpbIj6kV7N8a+sC6tWOJ/MUiLXj4d1CSWkFdUoSbvBvdC/6bWlCcHa3qBptzsEjWUEbBxsKEi1MnOw64dWQG/E2z3q5vm+qyFBfT0rgpWIxAMMfSLRsSpKdBVN0Hpm+gcV+ArNlhdrX3xRn4WCx5YVlvr1RivybWOjrnEKPt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=kudLCx5Z; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="kudLCx5Z"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-368a360bb1aso11730065ab.0
        for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 11:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711735379; x=1712340179; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QdcMw9p8wYMiyXmXvRCHMMbWNQHaQ3aY6vG2uVIiJB8=;
        b=kudLCx5ZSurhu/ihWQIZbAvJdDmm76Xa4TBVmtSXTaupe1Qc0opLr5K5sBk82k9ACS
         GxioXz2qJq/jHyYIFjZokXR/DY1mpsLRUaQ5yD7nalHApk39gl818oMoPG4OBulZL908
         UVFYVxd/ff288TlsrKAGn7Bhj+ePNas3ckF+y8NhuRjQZrMUTwzsguN7n/5Wo4gfOIyx
         lcht4b8Ew+seI1FtsJaKU4geRKKf1kFflTwsLvm/94ujvpX0Pr5grCgzial8ZM/B3jCY
         9Uh/z+nPs9b0x2+D/B30BiUh69D2+DGsakjqqXTgtuo8ecwNXWu49Gx8gg1rirltEswc
         EyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711735379; x=1712340179;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QdcMw9p8wYMiyXmXvRCHMMbWNQHaQ3aY6vG2uVIiJB8=;
        b=KU4aVwk1t4uR5W4OnYMVX2fiIRR+wceL479fqtAN1uZF+1HKaHYbGn3jCeupY2dMTx
         el9IEy4ZLM9Bn5lAzlpZJMDdhEhxHVXt2gVHowc8PcXe0thRkwUkixsS3VVXVOAAu3/v
         +vd6AA1hfRLSSHJj5+HS/pIHO+QtM4lU3D9k0VUx6U1oLplec5FudQ24NEAZjYvLeWj9
         H1xTVTVEC0DS+e7Fbk2vLUGLxvD1s7WGuNDGVpLoezREUeRgdQ7q06Ci0KiVoOq/TjG7
         LFyNJqK03NJLUEW/Wb7Sp2aSLZRY3TsJVgBeDV7L+GeYAgWEFackoTMNnEim+zxCHkv0
         P4eg==
X-Forwarded-Encrypted: i=1; AJvYcCWdIHZMv8Y7syUYd+E+WBXka8WtuulqMbM2tQkjVNPtIUb/NM926le2cGxy761EpaBFLgnuQAmo3q3vJd/fWLUutQNtEVztvZKM
X-Gm-Message-State: AOJu0YyUroX2rE75iYMcc3IpridoTy4Zyp/tNvIujzbnepSktLsluyYA
	43y5/p8ryAJfTh8FrySDTn4nezxJeuX9lWSbGkjKxWm81nUG4t6Uq//evFXYIkU=
X-Google-Smtp-Source: AGHT+IFqMNmDL2GVO2cyYm+vIEEaj43NPiUKo2CRXyyGfQmLknY9TtLFDSxdZDVwWotlePg1wJz6nw==
X-Received: by 2002:a92:ca4e:0:b0:366:ab6f:f6a with SMTP id q14-20020a92ca4e000000b00366ab6f0f6amr3003624ilo.24.1711735379197;
        Fri, 29 Mar 2024 11:02:59 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.190])
        by smtp.gmail.com with ESMTPSA id k4-20020a056e021a8400b003689a9e5017sm1217549ilv.47.2024.03.29.11.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 11:02:58 -0700 (PDT)
Message-ID: <0319d84e-ec4c-45a6-9edd-a606809371d8@sifive.com>
Date: Fri, 29 Mar 2024 13:02:56 -0500
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] x86: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
To: Dave Hansen <dave.hansen@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
References: <20240329072441.591471-1-samuel.holland@sifive.com>
 <20240329072441.591471-11-samuel.holland@sifive.com>
 <d2c3cd78-cdc6-4a39-9804-4f30402751b1@intel.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <d2c3cd78-cdc6-4a39-9804-4f30402751b1@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-03-29 12:28 PM, Dave Hansen wrote:
> On 3/29/24 00:18, Samuel Holland wrote:
>> +#
>> +# CFLAGS for compiling floating point code inside the kernel.
>> +#
>> +CC_FLAGS_FPU := -msse -msse2
>> +ifdef CONFIG_CC_IS_GCC
>> +# Stack alignment mismatch, proceed with caution.
>> +# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
>> +# (8B stack alignment).
>> +# See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53383
>> +#
>> +# The "-msse" in the first argument is there so that the
>> +# -mpreferred-stack-boundary=3 build error:
>> +#
>> +#  -mpreferred-stack-boundary=3 is not between 4 and 12
>> +#
>> +# can be triggered. Otherwise gcc doesn't complain.
>> +CC_FLAGS_FPU += -mhard-float
>> +CC_FLAGS_FPU += $(call cc-option,-msse -mpreferred-stack-boundary=3,-mpreferred-stack-boundary=4)
>> +endif
> 
> I was expecting to see this (now duplicate) hunk come _out_ of
> lib/Makefile somewhere in the series.
> 
> Did I miss that, or is there something keeping the duplicate there?

This hunk is removed in patch 15/15, after the conversion of lib/test_fpu.c:

https://lore.kernel.org/linux-kernel/20240329072441.591471-16-samuel.holland@sifive.com/

Regards,
Samuel

