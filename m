Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B406314A8D
	for <loongarch@lists.linux.dev>; Thu, 26 Feb 2026 09:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772098533; cv=none; b=B/6eidH/sxSov2m6Uwe5dxbGV5gvwTOLm6+Vc/+5WgioerUtjWYhaT9SnGqYtJso65/tgeQxgJaGJV3oJEOWTv3DtPsGAa3+s7hI1pTI3vwjpYGHYntN8x3dcVkBKjkH+Ran0EJgutQpvrWKtQuIyI4owRczYBZ6VsuGGQ21giw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772098533; c=relaxed/simple;
	bh=p5gP5tx9RQ7vZD9jKRbxdIIw6QLuFGxeAWtY8jM32Ds=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uaVNF6E0Nr3d14TOZStjp9D+nr+9h2tB4+oivZjzQr0vBxMjC1JjE4aV604bq3RMdmoJstqYw39UWMD/L/cCoOYI1LoafzKwHHpNfctmSdBXIFpvUtaT1z6WFswSKY31vX2Ghi5+PZRtjRM/DmPIPkE3IK0pxGna9JR/UuvanUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=DWNv0GeH; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=DWNv0GeH; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="DWNv0GeH";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="DWNv0GeH"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=cArUbXgPd0s4ZtREeL/7x46kP7PE/lat666eUsS6sDM=;
	b=DWNv0GeHcKAOhD5xvaCowiagwlW275NAmdFdeG8qlLEXg0HK9DVne1d75o15RGyJa7vwcAWO6
	vwEOtoSqxVKaatv+CDrTZSmvfXkTGoof3Dzf35VFrW/nnCipbp9TUQ6QsuUvS03Qv/DbB9CjEPb
	Q7rsPApKKIvJvhGOP5dZOd0=
Received: from canpmsgout01.his.huawei.com (unknown [172.19.92.178])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4fM5sL1vvrz1BGH1
	for <loongarch@lists.linux.dev>; Thu, 26 Feb 2026 17:35:02 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=cArUbXgPd0s4ZtREeL/7x46kP7PE/lat666eUsS6sDM=;
	b=DWNv0GeHcKAOhD5xvaCowiagwlW275NAmdFdeG8qlLEXg0HK9DVne1d75o15RGyJa7vwcAWO6
	vwEOtoSqxVKaatv+CDrTZSmvfXkTGoof3Dzf35VFrW/nnCipbp9TUQ6QsuUvS03Qv/DbB9CjEPb
	Q7rsPApKKIvJvhGOP5dZOd0=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fM5m15ySPz1T4Fg;
	Thu, 26 Feb 2026 17:30:25 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 11EC340567;
	Thu, 26 Feb 2026 17:35:19 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 26 Feb 2026 17:35:15 +0800
Message-ID: <15ea8a98-2b0c-dd51-b0d4-911905b194c3@huawei.com>
Date: Thu, 26 Feb 2026 17:35:14 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v6 1/5] powerpc/crash: sort crash memory ranges before
 preparing elfcorehdr
Content-Language: en-US
To: Baoquan He <bhe@redhat.com>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <vgoyal@redhat.com>,
	<dyoung@redhat.com>, <rdunlap@infradead.org>, <pmladek@suse.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <paulmck@kernel.org>,
	<lirongqing@baidu.com>, <arnd@arndb.de>, <ardb@kernel.org>,
	<leitao@debian.org>, <rppt@kernel.org>, <cfsworks@gmail.com>,
	<ryan.roberts@arm.com>, <sourabhjain@linux.ibm.com>,
	<tangyouling@kylinos.cn>, <eajames@linux.ibm.com>, <hbathini@linux.ibm.com>,
	<ritesh.list@gmail.com>, <songshuaishuai@tinylab.org>,
	<samuel.holland@sifive.com>, <kevin.brodsky@arm.com>,
	<vishal.moola@gmail.com>, <junhui.liu@pigmoral.tech>, <coxu@redhat.com>,
	<liaoyuanhong@vivo.com>, <fuqiang.wang@easystack.cn>, <jbohac@suse.cz>,
	<brgerst@gmail.com>, <x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <kexec@lists.infradead.org>
References: <20260224085342.387996-1-ruanjinjie@huawei.com>
 <20260224085342.387996-2-ruanjinjie@huawei.com>
 <aaARRZh9k_0oG3Qo@MiWiFi-R3L-srv>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aaARRZh9k_0oG3Qo@MiWiFi-R3L-srv>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2026/2/26 17:24, Baoquan He wrote:
> On 02/24/26 at 04:53pm, Jinjie Ruan wrote:
>> From: Sourabh Jain <sourabhjain@linux.ibm.com>
>>
>> During a memory hot-remove event, the elfcorehdr is rebuilt to exclude
>> the removed memory. While updating the crash memory ranges for this
>> operation, the crash memory ranges array can become unsorted. This
>> happens because remove_mem_range() may split a memory range into two
>> parts and append the higher-address part as a separate range at the end
>> of the array.
>>
>> So far, no issues have been observed due to the unsorted crash memory
>> ranges. However, this could lead to problems once crash memory range
>> removal is handled by generic code, as introduced in the upcoming
>> patches in this series.
>>
>> Currently, powerpc uses a platform-specific function,
>> remove_mem_range(), to exclude hot-removed memory from the crash memory
>> ranges. This function performs the same task as the generic
>> crash_exclude_mem_range() in crash_core.c. The generic helper also
>> ensures that the crash memory ranges remain sorted. So remove the
>> redundant powerpc-specific implementation and instead call
>> crash_exclude_mem_range_guarded() (which internally calls
>> crash_exclude_mem_range()) to exclude the hot-removed memory ranges.
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Baoquan he <bhe@redhat.com>
>> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
>> Cc: linux-kernel@vger.kernel.org
>> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> 
> You should add your own Signed-off-by since you sent it out.

Ack, I'll add my Signed-off-by in the next revision.
Thanks,

> 
>> ---
>>  arch/powerpc/include/asm/kexec_ranges.h |  4 +-
>>  arch/powerpc/kexec/crash.c              |  5 +-
>>  arch/powerpc/kexec/ranges.c             | 87 +------------------------
>>  3 files changed, 7 insertions(+), 89 deletions(-)
> ......snip...
> 
> 
