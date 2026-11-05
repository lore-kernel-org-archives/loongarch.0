Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865905;
	b=0SqLiNM44yc3SfYjpiQ9bOD1b8041Xh1aFvvjDZ+ZQwa24DQoul7VhZoF5YiErJkjVnL
	 CghQ3gJgV/4j3Wnx12/b1cyHw2v38F/GP2VorKUuTi+agY1Of8pM+gMZpQFyettRMy75T
	 UI0jaIF42PRvrHi6fOOFq+0kP4FP3+2qxSrQYXj/45xESBc4/qMJsSM6olWT3DHfeADIO
	 00+vbzVGUfo7Pp8JCUxHFiSq9KJXT5PFfXlwVv7TDfnmUZXLhch998L1m8SyaMl0dv2DS
	 UfO1Rw/X/l65gEjBvUtmp/eysgt1g4tqYBQNUhG1FnATbBYGBGoLEftu/wktrm67KPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865905;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=CCGzWBfX1X9cSsHPu2mqWEF8NpNHLDATFqyNNjfsFkw=;
	b=IqnZYBvQBoyHbHSTiCFxTU1REcQW7aFpihB7FlbAaU9ledK0ILnmteO/L1ypTT+OHwBR
	 Id9/N6ON1Wc2TkLLbFmOpRnxKrbHNcQ80lGGo28P91w82cgeiQBurCKDPPAHVMXqAZKpt
	 LAWF9TDBGMyJEgz7uuzt7z1lXidWEcXsGJxHUMYfk1PuI/D4kaqha+ppIhS8CvN+b666e
	 WLHQGtOP2FjD9Ed2x4c5WNWY3+2Gzh0qXi142MLaEWWuxXLzhDKKX8N2iuXqpE9PKHwVQ
	 3X49jPCgLxlhv6/NDyIDjbxAPYYP6nlyDqeMLlo0kPLb6M8nfSF0/yygXyYpGxs/spQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=3Lj0XuRp;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E115E606A31B
	for <loongarch@lists.linux.dev>; Thu,  5 Nov 2026 08:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E115E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=3Lj0XuRp
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=CCGzWBfX1X9cSsHPu2mqWEF8NpNHLDATFqyNNjfsFkw=;
	b=3Lj0XuRpdOCEztpedA6GSSl5x4O4JddmtxEbTLNoJlR2C54wDBW8jorT/6aOBic8BqPVyewSl
	x8e38gtEwgurpOUkkDhNyzVD/e6X4ayKuii44trLaEH0J0I7w9kRCxr2qDXmrth0z2EzyiGCtdk
	TbamYBpLt/lj+b5ImptgI7A=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jKvx71hllz12LDh;
	Thu,  5 Nov 2026 16:04:59 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D2F8E4057F;
	Thu,  5 Nov 2026 16:04:57 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 16:04:56 +0800
Message-ID: <2db15115-a06a-48ba-86a2-9a343f1e2a2b@huawei.com>
Date: Thu, 5 Nov 2026 16:04:55 +0800
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
	<coiby.xu@gmail.com>, <Yeking@red54.com>, <tangyouling@kylinos.cn>,
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
 <932cdfda-7030-4829-8b43-062d208450e4@huawei.com>
 <auw1qgmjWko52oS_@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <auw1qgmjWko52oS_@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/5 15:52, Mike Rapoport 写道:
> On Thu, Nov 05, 2026 at 11:45:39AM +0800, Jinjie Ruan wrote:
>> 在 2026/11/4 22:56, Mike Rapoport 写道:
>>
>>>> Patches 8-10 pass the kbuf fields to crash_prepare_headers() to
>>>> simplfy code.
>>>>
>>>> Patch 11 frees the elf core header from the generic post-load cleanup.
>>>>
>>>> Patches 12-15 add kexec_load_other_segments() and convert the three
>>>> architectures, and arch_kexec_setup_other_segments() builds
>>>> the architecture specific boot parameters (a DTB or a command line).
>>>
>>> I think the refactoring should go before the identical fixes in arch/
>>> code.
>>
>> However, this will cause trouble for the fix patch in the stable round.
> 
> That's right, but since actual fixes anyway require changes to kexec core,
> I think it's better to refactor first. The core than will take care of
> proper freeing in the most cases.

This way, each architecture doesn't have to worry about the issue of
incomplete resource release.

> 
> And since CMA support in kexec is quite new I think the entire set can be
> backported to stable then.

Make sense for me.

> 
> I'm planning to have a closer look at the refactoring Really Soon :) 

Thank you very much! Looking forward to your review.

> 
>> -- 
>> Best regards,
>> Jinjie
>>
> 

-- 
Best regards,
Jinjie

