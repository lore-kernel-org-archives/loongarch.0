Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF963AD50E
	for <loongarch@lists.linux.dev>; Thu,  7 May 2026 09:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146922; cv=none; b=T99tr3EA+7xrp8Ro5d7Dbal7Szf0Q7KUDgYqjcA1szK3cj/jQ+jPmkQeOt5UXrAnzDlnG7NSgVgpg4wk3o6R+btM/qQaIbfhZ/elMOXexspd7rG1J+4GHsccqbkEy1xgeLzLRIn0HgK0/G/GLlCVc/XWgXCCB7UIitMoJQYUugE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146922; c=relaxed/simple;
	bh=K1VCjRoLW0QcGM0dhJF4jAnQbIUr+A3+Rl8KKkOY/EQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FtvctJZN3Fx8Z7gXn5ESLF7XfPJJm2fAO5O4ilrh6iZsBYc1NPcUjYciWH0YxKBDoJLshl7GuqinziQ1hISc/gplTCZetrLNmLzrOnaU5zjACeRVyjyxSJEHlS3h6cVQWJ2UROIvfaVOAxXJ5Hx4jQzEREnJ4YwbEXHPtdLB+Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6OYXoM7; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6OYXoM7"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-83945063f70so854002b3a.0
        for <loongarch@lists.linux.dev>; Thu, 07 May 2026 02:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778146921; x=1778751721; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JUrNwnrnHXKNK1Z+tsaGPk05Wyp59KKsZWMiHJkBCuY=;
        b=F6OYXoM7KIq0zAzNK9VmzrQqOHnN4gNl7TBsKcrfsZkAie93YANOvi+Ffw/eLhCxAQ
         flohCGBfTWVf2aR7vVhHROHSxtbDaoP+uO/H+a/SUyIZNcpM6Dno7e6/xF7aJ90U9BQR
         8DDzmSIPEepfcCyzZey4wS9DLWobSdpOyzZ7OurbK/hh9iOEcAoD3VAJ7t5Y7NMfT8uZ
         NShKoYiHkXJ/oTeSreqYegDz8VrzOAcJiu4jB/W7P2wcJ2s6WJCsypFZhATAsadW3Ray
         +VAmh9oCN8xAlTryXJ+apW88ZoDBFhsBHkTcRIadi+fG+qFItblFw3EK4IuFdVZmJvnT
         RY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778146921; x=1778751721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUrNwnrnHXKNK1Z+tsaGPk05Wyp59KKsZWMiHJkBCuY=;
        b=seJ8YAa+T0eFNuCrraTy2iQYVtddKRorvuo2x9xg13TReW+H6o4sL7SNVzcJCjj7XG
         /usYhkJ+3nbD4R6bdPpJrnBeucHojrb5+RuSTNPc8vUoNsOZDqUMdEdmH5wcI2haT97S
         DDhBxU98ndUWn1/Ul06ftEzPEUtpdbkYf67JWehnWzQhMcEZb16m0n+++ZZ/pci51Hle
         7ATnWmq+njF33bK15J0Ru3puV2mF5iNg63RpNF6s4/AAdFFDMBVaebzkRQLa+Vx3jRZs
         2SYmf+0POwX4GXsChCLEbDASX+x6G6+i9hec/Mb+D4KXehmK12ZbCqlX0siAwC4svC2T
         c1pw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZiY6wlAeKxDrPQD5nN+Jc6yYVGcWBzZKHFVlGx9WHEUyzavCinyR34A9uA2kNy/zp8xJ8HlZ+H4k=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmOM+XXJTV9z8Ke25oBs418q23OTysutWms8dUa3SyYo5Uoh1/
	aUYOdMPqv7uTmZ6uBju+H2yq/feFoV/nL4Ny6COXAbdA5ZF1ed8RnmYb
X-Gm-Gg: AeBDietkOORMCmtbGx9XNaJ1FUsdfkIpp5MUpyoPyh5p16PbOYh+iQ0qUosl8xvSuWc
	EZ4TwaHr3CNC9/RZQTqT7Yl8LTK99felOmbnMzYfzjF7TIcPo87iuh7WA9ReL/1gVkNoLoEsP0P
	cCS+34TmnU+c730ZU4Jy8k91V5QZReUQXmcHU29bfhVFCPuis+C45P7YVDB+19ejpV7y5K4zTIK
	4JWjNpqthcNLRZtCeQXN3gTq00+KSUtERTmmTYzP7VCxC953AefngYq2LV3jKUn2sDUv7clOtCQ
	8wpvpaYFytE61ElZ7M8l14cXRGcIP6JCa2x8tXh0LIwjcwduFpj7/1o8FhNIaTc4YTNlq0FH/+T
	HB51qzTqVw7XeY/nqRGcFrDDOns3NaxIC8eaAUokBZihpPyu2IUlB2GqrSPV52z0c+Io/lf8nDP
	SNiCV9P757HDraeoLwZ9/FpEcQAUcnIRcWy9HBGL8ImZNCQDFUXcoc
X-Received: by 2002:a05:6a00:4093:b0:82f:3e9:7bec with SMTP id d2e1a72fcca58-83bb7abceeemr1949432b3a.12.1778146920796;
        Thu, 07 May 2026 02:42:00 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965c30ddasm10264549b3a.21.2026.05.07.02.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:42:00 -0700 (PDT)
Message-ID: <eece7690-634a-43c5-9b20-0afc174a89a0@gmail.com>
Date: Thu, 7 May 2026 17:41:49 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] of: reserved_mem: add linux,no-dump property
 support for reserved memory regions
To: Rob Herring <robh@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, saravanak@kernel.org, chenwandun@lixiang.com,
 zhaomeijing@lixiang.com, everyzhao@126.com
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
 <20260429065831.1510858-6-chenwandun@lixiang.com>
 <20260506144542.GA2072596-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260506144542.GA2072596-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/6/26 22:45, Rob Herring wrote:
> On Wed, Apr 29, 2026 at 02:58:25PM +0800, Chen Wandun wrote:
>> Add a 'no_dump' field to struct reserved_mem and parse the
>> 'linux,no-dump' device tree property during reserved memory node
>> initialization. This property allows device tree authors to mark
>> specific reserved memory regions that should be excluded from kdump
>> vmcore dumps.
>>
>> Reserved memory regions used by device firmware (e.g., GPU, DSP, modem)
>> typically contain data that is not useful for kernel crash analysis and
>> can significantly increase vmcore size. The 'linux,no-dump' property
>> provides a declarative way to indicate these regions should be filtered
>> out when constructing the elfcorehdr for kdump.
>>
>> The property is named with a 'linux,' prefix because kdump/vmcore is
>> Linux-specific and the property is an OS hint rather than a hardware
>> description, matching existing properties such as 'linux,cma-default'
>> and 'linux,usable-memory-range'.
>>
>> The 'linux,no-dump' property is only effective when the region:
>>   - Does not have 'no-map': these regions are already excluded from
>>     vmcore since they are removed from the linear mapping (MEMBLOCK_NOMAP).
>>   - Does not have 'reusable': CMA reusable regions are actively used by
>>     the kernel for movable page allocations, and their contents are
>>     valuable for crash analysis.
>>
>> The no-dump status is also printed in the boot log alongside the
>> existing nomap and reusable flags for diagnostic purposes.
> I think this property is the wrong way around and probably not needed.
> The default should be exclude the regions, but if Linux is using the
> regions (like CMA) then it can decide on its own to include them.
>
> With the restructuring that went into 7.1, it should be possible for the
> CMA code (and code for any other regions) to set some flag for the
> region.
Agree that the property direction is wrong. Rework in v2:
   - Default: exclude reserved regions from vmcore
   - CMA (reusable) setup path marks regions as kernel-managed general 
memory → include
   - No DT binding needed; linux,no-dump proposal withdrawn

Thanks.
>
> Rob

