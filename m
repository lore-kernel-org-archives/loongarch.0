Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793850350;
	b=QluOdygacMVe/WQDWeiO3TlCQqcpOhyj967ugdKuLTeCoqTlNSn5EqlB9lfCC3vJe60T
	 BO757jGFhwrBx9ZMT4kjsBzMqORS5wCFe/I9UzhOlj6Fo1Vb+IvbUUfWYGi/YsRP259sl
	 nxJ9WLkxol8FzFDmP84/+qXFgaj/RME9lZL4oOXrghAOWJe06MWglP8HFkW+RHaXctKOB
	 UvTBp7KkdXibgHF1rgD7t02zTY5Qbdl2grS8cX2PwCeEc41g/MY9eDUGJovu0tnorGHr2
	 rhIFGyWBcTtqMgqLEqB756Touk9xecD10J5qauY+4/V+3uNTfiUJcD9m7LiMxFqTeGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793850350;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=GHOzVgulqKSfBQS9r6LRjSpjMDUMY+tUmJ+96qhsSy0=;
	b=mbYl2M/Ktliph81TzWm4JY67YekUv1RV3hRtPulrUUFw/Mt80FGJF5vn5GS6z7JZZNEB
	 x+2FmNP7+90oQL9AGaIZNCpek9R+JqoCS2qJfMNTWXUmK6XBFnhX5R9h3ZODBN3KO6nt5
	 XKD4ubBTvDQVuqoxLCQhnJKgBQvSdBjlNegSby9YF+1Yq/pbafh227wWeNHXM5uRHSxh+
	 I/X/GXPMTkMrG0R6rNRe5ZoYD8NgKpn+lkj1+kp9JvKdsMF09qLjcZuRysn/wSMqQajEo
	 Smd5X+N1i1hGWwC8Yqt8yfcg7fW0ipi+LDSfXPcUTy+ApO7kY6ofOhyTgLjEHCA2XYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ut0sE6eg;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E4C606A331
	for <loongarch@lists.linux.dev>; Thu,  5 Nov 2026 03:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70E4C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ut0sE6eg
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=GHOzVgulqKSfBQS9r6LRjSpjMDUMY+tUmJ+96qhsSy0=;
	b=ut0sE6egSZYUWUEq0ClSmzZTO7nviP+RJ1qKMQYtk/w+rqWB0B+QNfbvGcaSu1w+C95A9M4jR
	jBbT1bl9PPkcxLRad2RsaYHl//ou1/Yel8XR6hmSDqoHQh56hAGw3vfWl4cxnST7B4lX5jEBpT2
	H+1ERGzJ4QEMZQBJPJYiUFU=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jKp9s00tGz1prRL;
	Thu,  5 Nov 2026 11:45:36 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 084FD2011D;
	Thu,  5 Nov 2026 11:45:42 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 11:45:39 +0800
Message-ID: <932cdfda-7030-4829-8b43-062d208450e4@huawei.com>
Date: Thu, 5 Nov 2026 11:45:39 +0800
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
Subject: Re: [PATCH v7 00/15] kexec: Fix CMA and elf header leaks and rework
To: Mike Rapoport <rppt@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<ritesh.list@gmail.com>, <sshegde@linux.ibm.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<baoquan.he@linux.dev>, <pasha.tatashin@soleen.com>, <pratyush@kernel.org>,
	<thuth@redhat.com>, <leitao@debian.org>, <yeoreum.yun@arm.com>,
	<robh@kernel.org>, <sourabhjain@linux.ibm.com>, <kees@kernel.org>,
	<coiby.xu@gmail.com>, <Yeking@Red54.com>, <tangyouling@kylinos.cn>,
	<maqianga@uniontech.com>, <zhangtianyang@loongson.cn>,
	<guodongtai@kylinos.cn>, <blum@kernel.org>, <adityag@linux.ibm.com>,
	<hui.wang@canonical.com>, <sohammetha01@gmail.com>, <guoren@kernel.org>,
	<gaohan@iscas.ac.cn>, <kai.huang@intel.com>, <kas@kernel.org>,
	<vishal.l.verma@intel.com>, <piliu@redhat.com>, <jbouron@amazon.com>,
	<mclapinski@google.com>, <me@linux.beauty>, <graf@amazon.com>,
	<bgwin@google.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<kexec@lists.infradead.org>
References: <20261026075201.699550-1-ruanjinjie@huawei.com>
 <179380419709.28814.2122135856184991710.b4-review@b4>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <179380419709.28814.2122135856184991710.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/4 22:56, Mike Rapoport 写道:
> Hi Jinjie,
> 

Hi Mike,

>> ARM64, LoongArch and RISC-V load the elf core header, initrd, DTB
>> and cmdline parameters with almost identical code. This series fixes
>> the bugs in that path. And as Mike suggested, rework the common part
>> into a helper.
>>
>> Patch 1 stops using the Image text_offset for arm64, which breaks CMA
>> segments in both the load and release paths, and rejects images with
>> a non-zero value.
>>
>> Patches 2-7 fix the CMA page and elf core header leaks in the retry
>> loops in arm64 and LoongArch, also fix a modified_cmdline leak
>> in LoongArch.
> 
> These mix fixes that can be easily merged via arch trees and something
> that depends on a change to the generic kexec code.

Thank you! I will split them to send in v8.

> 
> Besides, elf_headers leak and arm64's text_offset fixes should be
> applied to most if not all stable kernels, while CMA fixes are only for
> the relatively new kernels.

You are right. arm64 text_offset fix involves many versions.

If I remember correctly, the CMA patch that was fixed was only merged
this year.

> 
> I'd suggest splitting
> 
> 	arm64: kexec_file: Stop using the Image text_offset
> 	arm64: kexec_file: Fix elf_headers memory leak in retry loop
> 
> and sending as pure arm64 material, and
> 
> 
> 	LoongArch: kexec_file: Fix elf_headers memory leak in retry loop
> 	LoongArch: kexec_file: Fix a modified_cmdline leak
> 
> as pure LoongArch material.
> 
> And then working on CMA fixes after these land.


I agree with doing this; the patch will be cleaner and won't mix
different architectures with common code.

> 
> If there are real dependencies or potential conflicts, b4 prep can help
> you with managing them.

Indeed.

> 
>> Patches 8-10 pass the kbuf fields to crash_prepare_headers() to
>> simplfy code.
>>
>> Patch 11 frees the elf core header from the generic post-load cleanup.
>>
>> Patches 12-15 add kexec_load_other_segments() and convert the three
>> architectures, and arch_kexec_setup_other_segments() builds
>> the architecture specific boot parameters (a DTB or a command line).
> 
> I think the refactoring should go before the identical fixes in arch/
> code.

However, this will cause trouble for the fix patch in the stable round.

> 

-- 
Best regards,
Jinjie

