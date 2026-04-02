Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1226A3CBE98
	for <loongarch@lists.linux.dev>; Thu,  2 Apr 2026 11:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130492; cv=none; b=OzUsSTm7P8torVUspevMAiIl8AvKevKWc5MBFqX6PFH2IMhWIJMbXKXwgBlaJN6bQDM6ZTS8YWveNkmb1ngUkKGqVsP3RFGKbmSynBgNegncu57V10uLd9zFR8JLR2mQJ52vOl67zZNPXYz3YUJNFIh4l7wDcePpdIWiNWYes5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130492; c=relaxed/simple;
	bh=gUO/V5uvtYu5t5+8XfhNjCUuSp+MOp7rXIqsnq+VKII=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Vc/ZAhqr//+gmNbWZoJR5crALQ+8Dpg5ShX4cUzQm526O/glt2aI2pY0mrFRkh8sr6l7RMcn1JOcfDwaSXr01froHPXsTFG8F3VBkZvoFwTBj+hxXVLg+76o1NjDsGTc+rMNVvbg3Y4h8NJjZzzqn7kg2KUKA+4pqF+SvEneJ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Luc54heS; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="Luc54heS"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=o0BfAq2trtfASNnVxf9HHtrEQCspzeSBvKkdxZfJnW4=;
	b=Luc54heStVP+Ks1cf/+9Mie8Lxo+t9KmOQfujBmJXRPKkSvo/HJW2BgtlkbawbWBfCN9tRiOC
	MhfDfIGw5pwHoccffo+jZsj9vgYRqDLMIwGS/b1ztYLuinQEB7Mzu9JGS+etuJoT2GPKebOkefi
	174duOCnXseF0u2OAWDwFu0=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4fmg1R065LzRhSg;
	Thu,  2 Apr 2026 19:41:47 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 771BE40561;
	Thu,  2 Apr 2026 19:47:57 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 2 Apr 2026 19:47:55 +0800
Message-ID: <c6eb858c-5275-6fdc-b6e9-bd6d4b169e05@huawei.com>
Date: Thu, 2 Apr 2026 19:47:53 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v12 00/15] arm64/riscv: Add support for crashkernel CMA
 reservation
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<robh@kernel.org>, <saravanak@kernel.org>, <akpm@linux-foundation.org>,
	<bhe@redhat.com>, <vgoyal@redhat.com>, <dyoung@redhat.com>,
	<rdunlap@infradead.org>, <peterz@infradead.org>,
	<pawan.kumar.gupta@linux.intel.com>, <feng.tang@linux.alibaba.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<paulmck@kernel.org>, <lirongqing@baidu.com>, <rppt@kernel.org>,
	<leitao@debian.org>, <ardb@kernel.org>, <jbohac@suse.cz>,
	<cfsworks@gmail.com>, <tangyouling@kylinos.cn>, <sourabhjain@linux.ibm.com>,
	<ritesh.list@gmail.com>, <hbathini@linux.ibm.com>, <eajames@linux.ibm.com>,
	<guoren@kernel.org>, <songshuaishuai@tinylab.org>, <kevin.brodsky@arm.com>,
	<vishal.moola@gmail.com>, <junhui.liu@pigmoral.tech>, <coxu@redhat.com>,
	<fuqiang.wang@easystack.cn>, <liaoyuanhong@vivo.com>,
	<takahiro.akashi@linaro.org>, <james.morse@arm.com>, <lizhengyu3@huawei.com>,
	<x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<kexec@lists.infradead.org>
References: <20260402072701.628293-1-ruanjinjie@huawei.com>
 <20260402113137.GAac5Tmc5b7SL98KdY@fat_crate.local>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260402113137.GAac5Tmc5b7SL98KdY@fat_crate.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2026/4/2 19:31, Borislav Petkov wrote:
> On Thu, Apr 02, 2026 at 03:26:46PM +0800, Jinjie Ruan wrote:
>> The crash memory allocation, and the exclude of crashk_res, crashk_low_res
>> and crashk_cma memory are almost identical across different architectures,
>> This patch set handle them in crash core in a general way, which eliminate
>> a lot of duplication code.
> 
> From: Documentation/process/submitting-patches.rst
> 
> "Don't get discouraged - or impatient
> ------------------------------------
> 
> After you have submitted your change, be patient and wait.  Reviewers are
> busy people and may not get to your patch right away.
> 
> Once upon a time, patches used to disappear into the void without comment,
> but the development process works more smoothly than that now.  You should
> receive comments within a week or so; if that does not happen, make sure
> that you have sent your patches to the right place.  Wait for a minimum of
> 						     ^^^^^^^^^^^^^^^^^^^^^
> 
> one week before resubmitting or pinging reviewers - possibly longer during
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> busy times like merge windows."
> 
> You need to be patient and send once a week and not spam people:

Thank you for the reminder and for your patience. I apologize for the
frequent updates; I am becoming more familiar with the community's
workflow. I will follow your advice, limit my follow-ups to once a week,
and avoid resending during busy periods like the merge window. I'll wait
for further feedback before taking the next step.

> 
> Feb 04 Jinjie Ruan ( :1.0K|) [PATCH v3 0/3] arm64/riscv: Add support for crashkernel CMA reservation
> Feb 09 Jinjie Ruan ( :1.5K|) [PATCH v4 0/3] arm64/riscv: Add support for crashkernel CMA reservation
> Feb 12 Jinjie Ruan ( :2.1K|) [PATCH v5 0/4] arm64/riscv: Add support for crashkernel CMA reservation
> Feb 24 Jinjie Ruan ( :2.3K|) [PATCH v6 0/5] arm64/riscv: Add support for crashkernel CMA reservation
> Feb 26 Jinjie Ruan ( :2.5K|) [PATCH v7 0/5] arm64/riscv: Add support for crashkernel CMA reservation
> Mar 02 Jinjie Ruan ( :2.8K|) [PATCH v8 0/5] arm64/riscv: Add support for crashkernel CMA reservation
> Mar 23 Jinjie Ruan ( :2.9K|) [PATCH v9 0/5] arm64/riscv: Add support for crashkernel CMA reservation
> Mar 25 Jinjie Ruan ( :3.7K|) [PATCH v10 0/8] arm64/riscv: Add support for crashkernel CMA reservation
> Mar 28 Jinjie Ruan ( :4.3K|) [PATCH v11 00/11] arm64/riscv: Add support for crashkernel CMA reservation
> Apr 02 Jinjie Ruan ( :4.5K|) [PATCH v12 00/15] arm64/riscv: Add support for crashkernel CMA reservation
> 
