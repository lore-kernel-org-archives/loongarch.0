Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FBE3AA1B6
	for <loongarch@lists.linux.dev>; Tue, 28 Jul 2026 06:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785221146; cv=none; b=jUdYsJJkR2D2vvN46MiLXt9Q1Up2+odbv2RYO6L0pl7Ug3bbrhOBfj0QjjbJSBOe/tG/DjVs1/UQ57MVaV0GYPs23OifFYnApP8g3e41I7xNZuKZ4hAMCyOG7scLVU7LZshNMxfyAT38Rc6276BPfNUubCi5hQCmbHQFkBkxw0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785221146; c=relaxed/simple;
	bh=NFjJoarwjTziHpeWxF34h9ZK4G+OfT3+3OqIgq8m+MM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uzQFiQsnjcRgWYR3u+jMhm7Ke/qnupW8qHek3e+HYAwIe2VpXgvbgOPco7ZmO1Xe09naczq1QvdkpUw1alLFPrfvDaXzWynRy8shZ1etTFTXYv0J7WXzgwo484KAJUTcFq+2eD8Hmjexyz4HpGOIgNoy2fhLtHtKYPrGIUP6XC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OL3W3QX/; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OL3W3QX/"
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2cf49dc298bso33652245ad.0
        for <loongarch@lists.linux.dev>; Mon, 27 Jul 2026 23:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785221145; x=1785825945; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G9PHCPemx3I5IiaOZkfCpXgJjCP/3isLoWalQDvmgro=;
        b=OL3W3QX/wIeqKLE0f8zojkpsN3W/FponttfPjlZT0F5oycWsGlAhPPSMkHq8ADTvhF
         ihR7mQC8VcoETlmuW6b62LOG9uCKAcf9I6wuBUWdQMjqu+9yVBEz33JKP/a/PJkh//EO
         xUM4Wci0d7dHnpqBjSZP757pooOZbjx0e3lpYvhKF7RsdAP46DDfOrIaGyM4cnADMMGG
         BUC4xj85nvS8Mr8x9GE3BStiXuGuat/jHC1IbesrnkvI/L04w4ymiJkkUGHTt+pn8q7M
         UOEtzqfoo9WoNaKi+XD+1dKyIU095vHGdvKWQ+6Hld23znP0qppSCxz5cnyqX7an4W6M
         I4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785221145; x=1785825945;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G9PHCPemx3I5IiaOZkfCpXgJjCP/3isLoWalQDvmgro=;
        b=czaSN1l/yzX1i/+nulNGCod7m5jpfg4LEcBlFriWui0cE0w2/Palq8LHRQb6/MYY/X
         H7IebPicZCGn4VJ/+KXVEZD4YEXlIs9cJ/9h04y/IIT5JvBekDoj304zoiHTsCPgYDPC
         dzTF8jOxgKTzcqe/ezanzxNRG3lALniCa/QYeu1ewqSpRr7XnaG1Nx0vAO5tWofWlBZv
         4YsKHE031+vdK5N67i/uiEmEMPUBYFI1yPoeCkMcZZJavRMjKan+BWIn8dyf5PoyoIQU
         H5IReFx0y5kaNf9x8mxnBGbnIY+LT+AcgwHJpSLaarb3Fci0i7ju/EnPo9O9cWQsskuo
         IZ3w==
X-Forwarded-Encrypted: i=1; AHgh+RqdwAGaJr8/NPn1+7SNoJMlsBDLKyJ/QhIflWGUj4k1JfrevsNpy6ze3rDAX+jL5+wi2kU7iYb+bG8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyK2dfwzq3BqTXFylLbhwjS724d4dqea0tEa/QFYxTt9UbmZbDC
	nvVMa2CnpCMcXkfGJgibFMIscv+/0hvC+AC78XmwGG3IbosIbXHVrg60PyPfR6fCSQo=
X-Gm-Gg: AR+sD124MTZT8vhn61fj0aDvzRMNuVhMPZUOERUZSrfYWBc/smH+04+xZnII23qxwcy
	PepGZpqYsH59hZDh3crU9AzBwuF0RzJCZJ5gfOZIjsRVuRMqCqhFqntoH8DQfn7M8bsuUs3jbF/
	B5cN6uW+y+jiuazc+5Z0RVk429gmUU/BufpKnmwy5cOgYUd13RYCiyzYg+XGuQStnY4pJTw5dcv
	zUh8YwCfc9S4O/I0Irl18tWaOu0140o6cCL0Awn+i4jukc3J5Pb4OnbuthA22ZOeSR0pvE39Tcy
	3nmc9hrd55WHN8MLRuYhK5s1fnAkFpv+i2KySFfB5exYGapsr+5vCn4Keb1NcXRFShDIL71XA4l
	/Mh9bpJ/8ezbvZn6Lxr8Q7ahh1OBv8jgdoNbFGY3/VencjsyMfoiTr5SqgylWAfzp6cDd/6q4QR
	fHdqvVzzIocw==
X-Received: by 2002:a17:903:b90:b0:2ca:d9b3:715e with SMTP id d9443c01a7336-2d015c9b773mr13766995ad.9.1785221144689;
        Mon, 27 Jul 2026 23:45:44 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e1e26sm46147345ad.22.2026.07.27.23.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 23:45:43 -0700 (PDT)
Message-ID: <14ae96c1-707c-4999-bc9d-65ec74fbeff2@gmail.com>
Date: Tue, 28 Jul 2026 14:45:32 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/10] kdump: reduce vmcore size and capture time
To: Rob Herring <robh@kernel.org>, m.szyprowski@samsung.com
Cc: chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, saravanak@kernel.org,
 bhe@redhat.com, rppt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 kexec@lists.infradead.org, iommu@lists.linux.dev, zhaomeijing@lixiang.com,
 catalin.marinas@arm.com, will@kernel.org, alex@ghiti.fr,
 akpm@linux-foundation.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, robin.murphy@arm.com
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
 <20260723234126.GA3253409-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260723234126.GA3253409-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/24/26 07:41, Rob Herring wrote:
> On Tue, Jun 30, 2026 at 03:47:04PM +0800, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> On SoCs that carve out large firmware-owned reserved memory (GPU
>> firmware, DSP, modem, camera ISP, NPU, ...), kdump currently dumps
>> those carveouts as part of system RAM even though their contents are
>> firmware state that is not useful for kernel crash analysis.
> 
> What about reserved regions on ACPI based systems?

ACPI based systems already filter out these reserved regions from vmcore.
In the EFI memory map, firmware carveouts are reported with the type
EFI_RESERVED_TYPE. This type of memory gets the nomap flag set in
memblock.memory (is_usable_memory() returns false in reserve_regions()
and mark these regions with nomap flag), during prepare_elf_headers(),
for_each_mem_range() filters out these nomap regions. Therefore, the
memory reserved on ACPI based systems will not be dumped into the vmcore.
> 
>> This series introduces an opt-in 'dumpable' flag [1] on struct
>> reserved_mem and uses it to filter the elfcorehdr PT_LOAD ranges on
>> DT-based architectures (arm64, riscv, loongarch). By default reserved
>> regions are treated as non-dumpable; CMA regions are explicitly opted
>> in because their pages are returned to the buddy allocator and may
>> carry key crash-analysis data.
> 
> I never like seeing the same change being made to each architecture. 
> That's generally a sign of restructuring needed. loongarch and arm64 
> prepare_elf_headers() look about the same. riscv version uses 
> walk_system_ram_res() for some reason. 
> 
> Perhaps the dumpable flag belongs in memblock instead? Then at least we 
> wouldn't need more DT APIs exposed to the arch code, and the code stays 
> independent of the firmware API.

Agreed on both points. Adding the flag to memblock can indeed eliminate
the duplicated code in prepare_elf_headers, and avoid expose APIs to the
arch code.

I will add a dumpability marker to memblock for future extensibility
and to avoid duplicating the same code across different architectures.

I'm inclined to add a nodump flag, similar to nomap, by default all memory
is dumpable, and only the small fraction of memory that carries this flag
would be excluded from the vmcore, What do you think about this approach?

walk_system_ram_res() in riscv could be reworked into the same form as in
the arm64/loongarch architectures, will do in next version.

> 
> I'd really like Marek's review on the reserved memory code changes.

Marek, could you take a look when you have a chance about the reserved
memory code changes, I'm happy to respin and address any feedback.

> 
> Rob

Best regards,
Wandun

