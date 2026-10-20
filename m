Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486429;
	b=SErr+fQv3phLYHKjaX+C6gInvB7AEuYo56XdOrid9Ks5vlTRiGl76lv0FCptUm0r9zWN
	 yYS3XXWSfVFukyxYr/yB+y1PLtwp3ppMVTjAGeJOn68IVB/QMJSLkVfbAcNeyOyzB/DgX
	 IWaP1OSB62ApR0ytmfimotp7oHrDNadPrsAvLpAqS+ftve4XJVCmVaybAX0DbobdDI6p6
	 /jcglcWcn8PbKU6jVW2qjjAtgvb30DFXnq4AwsXss7nRMjhESighdsyNR3X6cqILHOG9C
	 v0z+B6VsLx9yqLle0SXQgo9Vno2Yz5E9GPKsbOXrvygBEBy6zIFsI/KAgvanwfdDCOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486429;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=LW2Z/J5kgMKXP1MQQy5oBk/GKxhYgHES/KC5diFwAwA=;
	b=3xot/zC30u9B6gHYXjpT7GfeSzhmO8/THlfcBXc8SLo27XMLNBmpx4dnESqceb3eX2x0
	 M8mWFsk8stu1472dBtdQ1GjEg8afRe/o3AU4QNfbo0PnGifTmXAZzpbROK4YqC7vwzFGg
	 63o3Uw/oUvC8lO6AWqwYTPqo4DexqexD5H9yiIvRB8uJYc0jzNwcbZL2pV10UMEgRNZfg
	 jHXpISSzpZgEIGFHm2sj6vVdXkCVsPVY3b4Xgb4mFWycmx8dqOadTE8t2TZwf4pQNNvIP
	 X/SoJZDgHnN8fuRo8BJR9fCxI8c2SIa5eMJJSYS1CKEgE1V/qcsuVl6/MFIWmeUUYEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	arc=none smtp.remote-ip=113.46.200.226
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7060606A31C;
	Tue, 20 Oct 2026 08:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7060606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=LW2Z/J5kgMKXP1MQQy5oBk/GKxhYgHES/KC5diFwAwA=;
	b=NbsVxKtA29oXvQv/BfIHkDIBuquaJ8mOke66Zav3POdMVfniAavgzeyYLX4KFePFgCEEiAP8V
	LAWFJMvvXYYOUMp0DrjKbjReXkvW9nAjpeYca8UmdFdXPeU0CXN+17VXYoRs37XNl+P0MKp1FNZ
	OM4Cc0ebyyVRcrXWBmTXElY=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4j85mQ36FBzKm5F;
	Tue, 20 Oct 2026 16:53:26 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 701724058A;
	Tue, 20 Oct 2026 16:53:30 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 16:53:28 +0800
Message-ID: <c1e0217c-d2a8-43e2-8038-984663c08fd7@huawei.com>
Date: Tue, 20 Oct 2026 16:53:27 +0800
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
Subject: Re: [PATCH v6 00/14] crash: Fix several bugs
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
 <179248377975.302547.11812783408034710690.b4-review@b4>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <179248377975.302547.11812783408034710690.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/10/20 16:09, Mike Rapoport 写道:
> Hi Jinjie,
> 
> Sorry for the delay, it's been really busy time for me.

Hi Mike,

Thank you for the feedback, and no problem at all for the delay.

> 
>> As Baoquan and Catalin suggested, this patch set fixes
>> several pre-existing code issues found by Sashiko AI [1][2][3].
>>
>> The major improvements and fixes included in this series are:
>> - Fix several memory leaks for arm64, and similar issues on LoongArch
>> - Fix out-of-bounds write on 32-bit Highmem for x86.
>> - Fix TOCTOU race in crash memory range collection.
> 
> It feels like these are three independent series, maybe with slight
> dependencies because they touch related code, but it's not really a
> single series:

Ok, will split this into three independent patch series.

> 
>> Jinjie Ruan (14):
>>   kexec: Fix CMA segment address translation with non-zero text_offset
>>   kexec: Record allocated CMA pages to fix release size mismatch
>>   kexec: Extract kexec_free_segment_cma() from kimage_free_cma()
>>   arm64: kexec_file: Fix CMA page leaks in segment placement retry loops
>>   arm64: kexec_file: Fix elf_headers memory leak in retry loop
>>   LoongArch: kexec_file: Fix CMA page leaks in segment placement retry
>>     loops
>>   LoongArch: kexec_file: Fix elf_headers memory leak in retry loop
> 
> The very similar commits for arm64 and LoongArch imply that that we have
> some code duplication that should be addressed regardless of these

Will clean up the duplicated code in generic kexec first, and then fix
the bugs.

> fixes.
> 

-- 
Best regards,
Jinjie

