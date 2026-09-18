Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9141E9B37
	for <loongarch@lists.linux.dev>; Fri, 18 Sep 2026 10:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728829; cv=none; b=CAqImwtMNR+2+nfBcNaDxxk1y4ihXNvHaWRCDYLl5wVXTP8ex23mfvL+bloC4UCRa+7Uj7ST/NXlMQm52d0FvBB/ttwIcbdYZsdWXpqYifEd3TzlGbRsy47nQARNK1G1S1Jl4VdvUBpUSt93SYsdy8IXJy1FPkA3pKScZZtejHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728829; c=relaxed/simple;
	bh=ZUwGpl30HDIT8l2z/Osc/Y3a2vr84b85yvTBFDvsGtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SJgVdo9lgfIwSPe2nnEYIbDBnIhpsDGViU3wv6UfBViLoexrhKIdrr4ZaPLUoxAGAigAoqDJt/YsKAGDLW1g7bZwHLVPeIZ0+EhYe9jIw4uqfai4YkWAoYtr20D2BYbcD9F89fBBNyaWA9CO41lq2i42Tl0tG1ZG6GN/geBNWUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GoSSnE/b; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GoSSnE/b"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2caced6038eso4986755ad.0
        for <loongarch@lists.linux.dev>; Fri, 18 Sep 2026 03:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789728825; x=1790333625; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAR8zhCOEVqWXPt6vBsjOMeeQmFuBz9UsZFbgyML5lo=;
        b=GoSSnE/bQGOQZQkPu5rGRPLo6VEn83JoD6CiotL0+48UOkFJOUGdKxDMNh0RBly1Si
         jVCkx5z4eCDtLSpWBmKM5tDO1ku00WrJiXQhBQ+mzCXbFSvnr1cXeNWgm33Epx0gx6vk
         QPPfipsXyqf8wvEzD0lXkhhBsp4ZhDpScaOevQ12bwqHTs5PmikkhB0MUVlq1dQNNBXt
         l3Gu1P8XbdqMrKriW7CcmPx3ZuJK2jWbTUZgGTnaCIDtxBFK5UV/skljxIVkToM/pWmA
         efWlapsCNLiGwJWnXz8q1KKoxMSdZ0O2suBDIVZUd6ltRG+0aOfmv48q0jAg4gOlNnd7
         AhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789728825; x=1790333625;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAR8zhCOEVqWXPt6vBsjOMeeQmFuBz9UsZFbgyML5lo=;
        b=PJWJcCwIc3e1RdeolyLw81iar5zRJLyX4al3gAUcyqwBU9jaKtYiYChxjSJBobkeas
         dIdZ9B/8FHGLJG0weXzM83o5TVFJbNXZDr90fN9BDcNXLjqDgZ/45A9ahgZKJDFahvyD
         FsdRqlWteMN5YRE4Q7D04Ot5ZW7um2Hz4USTpZGq38PTa3TU42gk56JYBsPPTLV0YXzF
         eoXwrlZBzlWsHiiYd2dxpk6KnfPylnswKBjGonsnCVLpNBM/McaQpPB0KXMj2T8NocOV
         aihTsDiTQqqnMu5qO1JOzjhbDGpseQLl8q2fQBCEGqlkERSbh+xTuDIQfgEfsevG4rQf
         M3KA==
X-Forwarded-Encrypted: i=1; AKwUvBx6pb6mrT6XEsnECZRiYun0m2eMWvclOuEuHcohxql3Z0yBHtvtYk4GS/ovL6nau/hIneb8NT2FnuU=@lists.linux.dev
X-Gm-Message-State: AFuF++nes9d6Dyq8ClBFYwUVpeLCxW/NZGNEFZZuPepUm7Z7PtdbGCoM
	+8SGHDTS+dhZfe7mAmFAXJqV7pgXwUvnRWVeQaMFCa8uv/XqcJWvFOis
X-Gm-Gg: AYBFou0Z1fMdiubC4kPFMUoGhHY7Zum1xpfQsp/0BSfCxGb77sDioDfbelvcw43O33N
	sfdNZlkHCo67nhwTKEey8QEFyppNB+ZqwJm3WriqAzOjOyB7VkPpUnDIWFu38DaLYtwQULpZl4s
	vqMHgogAN4I3AaFYwhgGBoWtKpLUWBS3APJtQPHw+ZaNvTmc/AdLJp5IlcPDoZWUrU+/AEcIEwd
	DIcpwDJP2X8lGL+Cp7ty6WeabanQvaMpWh9P1u7O2t9z1tKeud+ADdCswL2vseyB6Y58JiY1m4f
	/8ejktyyZmDVj3jYhIP/NV65k3/dCWmdIjW0OwrahAHOuM2o6qtSO1yRszKT5r8KghTuBhkVewQ
	0n8hqwZwlxrNSjDSannOot950pXeHjCIWJKIZjdJW1LXXbag+zJodVzlbBYjJ1gcuNCthNXw6HV
	EhogoAL/UXQCgXp6emI/W5jqpuMDoZYvQzX52DKFOwj6VAqOKkSakMYJ8hEcta8ix+5CN7fuyI+
	STPyg==
X-Received: by 2002:a17:902:cecc:b0:2d8:d4d2:d139 with SMTP id d9443c01a7336-2dd9ca3f088mr93269015ad.21.1789728825328;
        Fri, 18 Sep 2026 03:53:45 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb7525b2asm5835555ad.19.2026.09.18.03.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:53:44 -0700 (PDT)
Message-ID: <1a47d5de-fb68-4c10-a199-f0d274689cdc@gmail.com>
Date: Fri, 18 Sep 2026 18:53:32 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/10] kdump: reduce vmcore size and capture time
To: Baoquan He <baoquan.he@linux.dev>
Cc: catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 m.szyprowski@samsung.com, mark.rutland@arm.com, kernel@xen0n.name,
 alex@ghiti.fr, hpa@zytor.com, ruirui.yang@linux.dev, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org, linux-mm@kvack.org,
 iommu@lists.linux.dev
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <aqzznOgILX2pZg7b@fedora>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <aqzznOgILX2pZg7b@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 9/18/26 16:17, Baoquan He wrote:
> On 09/02/26 at 03:31pm, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
> ...snip... 
>> ACPI systems already filter reserved memory out of the vmcore through
>> their existing path; only DT-based systems currently fail to filter these
>> regions, which is what this series addresses. The flag lives in memblock
>> itself rather than in a DT-only structure, so the mechanism is generic and
>                                                                  ~~~
> The patchset itself looks goot to me, while I am concerned if it's
> really generic. I raised that in sub-thread talking with Wandun. Imagine
> I tried to exclude many driver regions and split memblock regions into
> hundreds, cma could yell out: cma_declare_contiguous_multi()?

Are you concerned that setting the MEMBLOCK_NODUMP flag could split a memblock
region into many smaller regions, which might then prevent
cma_declare_contiguous_multi() from satisfying a multi-range allocation?
If so, IICU I don’t think that applies here.

MEMBLOCK_NODUMP is currently only set on memory that has already been reserved.
These regions are excluded when iterating over free memory, so marking them NODUMP
does not increase the number of free regions seen by CMA.


Before marking NODUMP:

  memblock.memory:    [ free ] [ reserved ] [ free ]
  memblock.reserved:           [ reserved ]

Now, for memblock.memory, it is one region that contains free and reserved memory.


After marking the reserved region NODUMP:

  memblock.memory:    [ free ] [  NODUMP  ] [ free ]
  memblock.reserved:           [ reserved ]

for memblock.memory, it splits into 3 regions, 2 free regions, 1 nodump region.

Although the memblock.memory array may be split internally, it does not create additional
free ranges for cma_declare_contiguous_multi() to process.


> 
> IMHO, withdrawing the claim can fix the nit concern. If I am wrong,
> please help point it out to let me learn more.

I will revise this description to avoid any misunderstanding.

Best regards,
Wandun


> 
> Thanks
> Baoquan
> 
>> both ACPI and DT systems can benefit from it (suggested by Rob, thanks) [1].
>>
>> Since the reserved memory regions are filtered out, the vmcore is
>> smaller in size and faster to produce. 
>>
> ...snip...

