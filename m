Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485766;
	b=hzz8E1+BFh2U43FIUUiZP3hgaUrudsMG45gqCoYT2jXOs1y6ncIfNVYYQFVxI1IdtTqW
	 I2OflpFg/YEA3VPhHC7/l2H7Z8jb6zgEgczDgZdI8q5JWw8Of0U7zaud6SOp62KfCEG+H
	 PMTnEf8q2xsjRBE3AkjoQKfWJH71+PNJNeQjWivR5jap1Fjo0UaP5OBNPfUxKoamJAknC
	 B4YJSNl372GgCh6SWGu8G8vWhSkGD/M/NZFS/kPY6cPjoZsDVYygm6+as2CLsgG9JPbaC
	 yNB9jIq53EyB/l44ay7BHTAAfgAUZ0LxDZFXq9YDZ4yDjDsK0np2p8nSv3eu7UkHZMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485766;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=eRsANuJnPqOE4Wj3tiehoMvQqcYK+mSj3Cw9/PCh2hs=;
	b=dWGGjOH3JioLmw7+13vd827EatqXlE5w11x/k7nPI07VHSpenQaxp9ym60pc6edr0Gea
	 94kUtMjzOqhxaCMrDnBETAVqYqNG1HX07ENqljn4X9GTtWyk93ZDIeBm+68EXFqYBeUNC
	 zajuwW4QcYEDJXC3VeXDDgFKk7NJjcSLRakwnKE5UKHuYZ/Rm13htnYLDrGLLGsO9+kAX
	 ujiv/J26XEhOs1jXP9q+vLbFdSZp1GwixC0NkzHGfLnemb7uavkMoOdv8eSM/860ptZnI
	 Adugju7MmXw0dmCsiymR0pan2Zjwa3Y0sGRs6CInHTHS8ej92oh7iE2t8x8I9ilP2+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=025hmGKr;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DDC606A31C;
	Tue, 20 Oct 2026 08:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8DDC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=025hmGKr
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=eRsANuJnPqOE4Wj3tiehoMvQqcYK+mSj3Cw9/PCh2hs=;
	b=025hmGKrN+QZiKfKk4CvMhbfukHdUUN7geXfiPjgluCJuZBPjCIfgCpEh2Alr5rnWzL2ZnYwN
	zP1/fkmrTQRQoHpYGCTWembsgsp2yHLnATyrHv5q15C53+q27QslhyGi1JB1NO1j8V6Bpm2++av
	+isRXcbNUthqnmgDVVXQsnk=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4j85X13M1lz12LHp;
	Tue, 20 Oct 2026 16:42:41 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D1DE940575;
	Tue, 20 Oct 2026 16:42:40 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 16:42:38 +0800
Message-ID: <5c3ba82b-606b-4dd1-b265-4b567c646895@huawei.com>
Date: Tue, 20 Oct 2026 16:42:37 +0800
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/14] kexec: Fix CMA segment address translation with
 non-zero text_offset
To: Mike Rapoport <rppt@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<ritesh.list@gmail.com>, <sshegde@linux.ibm.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<dakr@kernel.org>, <akpm@linux-foundation.org>, <baoquan.he@linux.dev>,
	<pasha.tatashin@soleen.com>, <pratyush@kernel.org>, <ruirui.yang@linux.dev>,
	<leitao@debian.org>, <yeoreum.yun@arm.com>, <sourabhjain@linux.ibm.com>,
	<robh@kernel.org>, <coxu@redhat.com>, <kees@kernel.org>,
	<tangyouling@kylinos.cn>, <liukexin@kylinos.cn>, <zhangtianyang@loongson.cn>,
	<guodongtai@kylinos.cn>, <maqianga@uniontech.com>, <chao.gao@intel.com>,
	<kai.huang@intel.com>, <vishal.l.verma@intel.com>, <seanjc@google.com>,
	<piliu@redhat.com>, <thuth@redhat.com>, <jbouron@amazon.com>,
	<me@linux.beauty>, <mclapinski@google.com>, <graf@amazon.com>,
	<bgwin@google.com>, <hbathini@linux.ibm.com>, <eric.devolder@oracle.com>,
	<takahiro.akashi@linaro.org>, <james.morse@arm.com>, <palmer@rivosinc.com>,
	<x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <driver-core@lists.linux.dev>,
	<kexec@lists.infradead.org>
References: <20260921090450.807575-1-ruanjinjie@huawei.com>
 <20260921090450.807575-2-ruanjinjie@huawei.com>
 <179248377975.302547.13172455257147735569.b4-review@b4>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <179248377975.302547.13172455257147735569.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/10/20 16:09, Mike Rapoport 写道:
>> kimage_load_cma_segment() and kimage_map_segment() both translate
>> a CMA segment using page_address(cma), which returns the CMA base
>> address. This ignores segment->mem.
>>
>> On arm64, image_load() adds text_offset to segment->mem before the
>> segment is loaded:
>>
>> 	kernel_segment->mem += text_offset;
>> 	kernel_segment->memsz -= text_offset;
>> 	image->start = kernel_segment->mem;
> 
> That's true, but since commit 751c263bb74f ("arm64: remove TEXT_OFFSET
> randomization") TEXT_OFFSET is always zero. This is upstream from v5.8,
> so no LTS kernels has non-zero TEST_OFFSET.
> 
> Maybe we should rather start deprecating .text_offset in arm64?

I completely agree. This will save us from a lot of unnecessary changes.

> 

-- 
Best regards,
Jinjie

